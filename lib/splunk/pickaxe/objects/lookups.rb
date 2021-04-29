# frozen_string_literal: true

require 'splunk/pickaxe/objects'
require 'splunk/pickaxe/objects/supported_keys'

module Splunk
  module Pickaxe
    class Lookups < Objects
      DIR ||= 'lookups'

      def splunk_resource
        %w[data lookup-table-files]
      end

      def entity_dir
        DIR
      end

      def entity_file_path(splunk_entity)
        File.join(
          pickaxe_config.execution_path, entity_dir,
          entity_file_name(splunk_entity)
        )
      end

      # Tags do not follow the typical conventions that other splunk resources do
      # so we have to change the find/create/update methods
      def find(entity)
        # Either return the entity or nil if it doesn't exist

        response = service.request(method: :GET, resource: splunk_resource + [name(entity)])
        # Parse out fields
        atom_feed = Splunk::AtomFeed.new(response.body)
        atom_feed.entries.map { |e| e['title'] }
      rescue Splunk::SplunkHTTPError => e
        if e.code == 404
          nil
        else
          raise e
        end
      end

      def create(entity)
        # Create and update are the same thing
        update [], entity
      end

      def update(splunk_entity, entity)
        service.create_oneshot("| makeresults | eval field1=''| outputlookup #{splunk_entity.name}")
      end

      def splunk_config(entity)
        entity['fields']
      end

      def needs_update?(splunk_entity, entity)
        # Compares the fields in our config vs whats in splunk
        splunk_config(entity).uniq.sort != splunk_entity.uniq.sort
      end

      def write_to_file(file_path, overwrite, splunk_entity)
        if overwrite || !File.exist?(file_path)
          overwritten = overwrite && File.exist?(file_path)
  
          data = service.create_export("|inputlookup #{splunk_entity.name}", output_mode: 'csv').to_s
          File.write(file_path, {
            'name' => splunk_entity.name,
            'config' => splunk_entity_keys
                          .map { |k| { k => splunk_entity.fetch(k) } }
                          .reduce({}) { |memo, setting| memo.update(setting) },
            'data' => data
          }.to_yaml)
          puts overwritten ? '  Overwritten' : '  Created'
        else
          puts '  Already exists'
        end
      end
    end
  end
end
