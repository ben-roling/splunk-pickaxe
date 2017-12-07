# rubocop:disable Metrics/LineLength

module Splunk
  module Pickaxe
    ALERT_KEYS = %w[action.email action.email.sendresults action.email.to action.populate_lookup action.rss action.script action.summary_index actions alert.digest_mode alert.expires alert.severity alert.suppress alert.suppress.fields alert.suppress.period alert.track alert_comparator alert_condition alert_threshold alert_type auto_summarize auto_summarize.command auto_summarize.cron_schedule auto_summarize.dispatch.earliest_time auto_summarize.dispatch.latest_time auto_summarize.dispatch.time_format auto_summarize.dispatch.ttl auto_summarize.max_concurrent auto_summarize.max_disabled_buckets auto_summarize.max_summary_ratio auto_summarize.max_summary_size auto_summarize.max_time auto_summarize.suspend_period auto_summarize.timespan cron_schedule description disabled dispatch.auto_cancel dispatch.auto_pause dispatch.buckets dispatch.earliest_time dispatch.index_earliest dispatch.index_latest dispatch.indexedRealtime dispatch.latest_time dispatch.lookups dispatch.max_count dispatch.max_time dispatch.reduce_freq dispatch.rt_backfill dispatch.spawn_process dispatch.time_format dispatch.ttl dispatchAs display.events.fields display.events.list.drilldown display.events.list.wrap display.events.maxLines display.events.raw.drilldown display.events.rowNumbers display.events.table.drilldown display.events.table.wrap display.events.type display.general.enablePreview display.general.migratedFromViewState display.general.timeRangePicker.show display.general.type display.page.search.mode display.page.search.patterns.sensitivity display.page.search.showFields display.page.search.tab display.page.search.timeline.format display.page.search.timeline.scale display.statistics.drilldown display.statistics.overlay display.statistics.rowNumbers display.statistics.show display.statistics.wrap display.visualizations.chartHeight display.visualizations.charting.axisLabelsX.majorLabelStyle.overflowMode display.visualizations.charting.axisLabelsX.majorLabelStyle.rotation display.visualizations.charting.axisLabelsX.majorUnit display.visualizations.charting.axisLabelsY.majorUnit display.visualizations.charting.axisLabelsY2.majorUnit display.visualizations.charting.axisTitleX.text display.visualizations.charting.axisTitleX.visibility display.visualizations.charting.axisTitleY.text display.visualizations.charting.axisTitleY.visibility display.visualizations.charting.axisTitleY2.text display.visualizations.charting.axisTitleY2.visibility display.visualizations.charting.axisX.maximumNumber display.visualizations.charting.axisX.minimumNumber display.visualizations.charting.axisX.scale display.visualizations.charting.axisY.maximumNumber display.visualizations.charting.axisY.minimumNumber display.visualizations.charting.axisY.scale display.visualizations.charting.axisY2.enabled display.visualizations.charting.axisY2.maximumNumber display.visualizations.charting.axisY2.minimumNumber display.visualizations.charting.axisY2.scale display.visualizations.charting.chart display.visualizations.charting.chart.bubbleMaximumSize display.visualizations.charting.chart.bubbleMinimumSize display.visualizations.charting.chart.bubbleSizeBy display.visualizations.charting.chart.nullValueMode display.visualizations.charting.chart.overlayFields display.visualizations.charting.chart.rangeValues display.visualizations.charting.chart.showDataLabels display.visualizations.charting.chart.sliceCollapsingThreshold display.visualizations.charting.chart.stackMode display.visualizations.charting.chart.style display.visualizations.charting.drilldown display.visualizations.charting.gaugeColors display.visualizations.charting.layout.splitSeries display.visualizations.charting.layout.splitSeries.allowIndependentYRanges display.visualizations.charting.legend.labelStyle.overflowMode display.visualizations.charting.legend.placement display.visualizations.mapHeight display.visualizations.mapping.choroplethLayer.colorBins display.visualizations.mapping.choroplethLayer.colorMode display.visualizations.mapping.choroplethLayer.maximumColor display.visualizations.mapping.choroplethLayer.minimumColor display.visualizations.mapping.choroplethLayer.neutralPoint display.visualizations.mapping.choroplethLayer.shapeOpacity display.visualizations.mapping.choroplethLayer.showBorder display.visualizations.mapping.data.maxClusters display.visualizations.mapping.drilldown display.visualizations.mapping.map.center display.visualizations.mapping.map.panning display.visualizations.mapping.map.scrollZoom display.visualizations.mapping.map.zoom display.visualizations.mapping.markerLayer.markerMaxSize display.visualizations.mapping.markerLayer.markerMinSize display.visualizations.mapping.markerLayer.markerOpacity display.visualizations.mapping.showTiles display.visualizations.mapping.tileLayer.maxZoom display.visualizations.mapping.tileLayer.minZoom display.visualizations.mapping.tileLayer.tileOpacity display.visualizations.mapping.tileLayer.url display.visualizations.mapping.type display.visualizations.show display.visualizations.singlevalue.afterLabel display.visualizations.singlevalue.beforeLabel display.visualizations.singlevalue.colorBy display.visualizations.singlevalue.colorMode display.visualizations.singlevalue.numberPrecision display.visualizations.singlevalue.rangeColors display.visualizations.singlevalue.rangeValues display.visualizations.singlevalue.showSparkline display.visualizations.singlevalue.showTrendIndicator display.visualizations.singlevalue.trendColorInterpretation display.visualizations.singlevalue.trendDisplayMode display.visualizations.singlevalue.trendInterval display.visualizations.singlevalue.underLabel display.visualizations.singlevalue.useColors display.visualizations.singlevalue.useThousandSeparators display.visualizations.singlevalueHeight display.visualizations.type displayview is_scheduled is_visible max_concurrent next_scheduled_time qualifiedSearch realtime_schedule request.ui_dispatch_app request.ui_dispatch_view restart_on_searchpeer_add run_n_times run_on_startup schedule_window search vsid].freeze
    EVENT_TYPES_KEYS = %w[description disabled priority search tags].freeze
    FIELD_EXTRACTIONS_KEYS = %w[stanza type value].freeze
    REPORT_KEYS = %w[action.email action.email.sendresults action.email.to action.populate_lookup action.rss action.script action.summary_index actions alert.digest_mode alert.expires alert.severity alert.suppress alert.suppress.fields alert.suppress.period alert.track alert_comparator alert_condition alert_threshold alert_type auto_summarize auto_summarize.command auto_summarize.cron_schedule auto_summarize.dispatch.earliest_time auto_summarize.dispatch.latest_time auto_summarize.dispatch.time_format auto_summarize.dispatch.ttl auto_summarize.max_concurrent auto_summarize.max_disabled_buckets auto_summarize.max_summary_ratio auto_summarize.max_summary_size auto_summarize.max_time auto_summarize.suspend_period auto_summarize.timespan cron_schedule description disabled dispatch.auto_cancel dispatch.auto_pause dispatch.buckets dispatch.earliest_time dispatch.index_earliest dispatch.index_latest dispatch.indexedRealtime dispatch.latest_time dispatch.lookups dispatch.max_count dispatch.max_time dispatch.reduce_freq dispatch.rt_backfill dispatch.spawn_process dispatch.time_format dispatch.ttl dispatchAs display.events.fields display.events.list.drilldown display.events.list.wrap display.events.maxLines display.events.raw.drilldown display.events.rowNumbers display.events.table.drilldown display.events.table.wrap display.events.type display.general.enablePreview display.general.migratedFromViewState display.general.timeRangePicker.show display.general.type display.page.search.mode display.page.search.patterns.sensitivity display.page.search.showFields display.page.search.tab display.page.search.timeline.format display.page.search.timeline.scale display.statistics.drilldown display.statistics.overlay display.statistics.rowNumbers display.statistics.show display.statistics.wrap display.visualizations.chartHeight display.visualizations.charting.axisLabelsX.majorLabelStyle.overflowMode display.visualizations.charting.axisLabelsX.majorLabelStyle.rotation display.visualizations.charting.axisLabelsX.majorUnit display.visualizations.charting.axisLabelsY.majorUnit display.visualizations.charting.axisLabelsY2.majorUnit display.visualizations.charting.axisTitleX.text display.visualizations.charting.axisTitleX.visibility display.visualizations.charting.axisTitleY.text display.visualizations.charting.axisTitleY.visibility display.visualizations.charting.axisTitleY2.text display.visualizations.charting.axisTitleY2.visibility display.visualizations.charting.axisX.maximumNumber display.visualizations.charting.axisX.minimumNumber display.visualizations.charting.axisX.scale display.visualizations.charting.axisY.maximumNumber display.visualizations.charting.axisY.minimumNumber display.visualizations.charting.axisY.scale display.visualizations.charting.axisY2.enabled display.visualizations.charting.axisY2.maximumNumber display.visualizations.charting.axisY2.minimumNumber display.visualizations.charting.axisY2.scale display.visualizations.charting.chart display.visualizations.charting.chart.bubbleMaximumSize display.visualizations.charting.chart.bubbleMinimumSize display.visualizations.charting.chart.bubbleSizeBy display.visualizations.charting.chart.nullValueMode display.visualizations.charting.chart.overlayFields display.visualizations.charting.chart.rangeValues display.visualizations.charting.chart.showDataLabels display.visualizations.charting.chart.sliceCollapsingThreshold display.visualizations.charting.chart.stackMode display.visualizations.charting.chart.style display.visualizations.charting.drilldown display.visualizations.charting.gaugeColors display.visualizations.charting.layout.splitSeries display.visualizations.charting.layout.splitSeries.allowIndependentYRanges display.visualizations.charting.legend.labelStyle.overflowMode display.visualizations.charting.legend.placement display.visualizations.mapHeight display.visualizations.mapping.choroplethLayer.colorBins display.visualizations.mapping.choroplethLayer.colorMode display.visualizations.mapping.choroplethLayer.maximumColor display.visualizations.mapping.choroplethLayer.minimumColor display.visualizations.mapping.choroplethLayer.neutralPoint display.visualizations.mapping.choroplethLayer.shapeOpacity display.visualizations.mapping.choroplethLayer.showBorder display.visualizations.mapping.data.maxClusters display.visualizations.mapping.drilldown display.visualizations.mapping.map.center display.visualizations.mapping.map.panning display.visualizations.mapping.map.scrollZoom display.visualizations.mapping.map.zoom display.visualizations.mapping.markerLayer.markerMaxSize display.visualizations.mapping.markerLayer.markerMinSize display.visualizations.mapping.markerLayer.markerOpacity display.visualizations.mapping.showTiles display.visualizations.mapping.tileLayer.maxZoom display.visualizations.mapping.tileLayer.minZoom display.visualizations.mapping.tileLayer.tileOpacity display.visualizations.mapping.tileLayer.url display.visualizations.mapping.type display.visualizations.show display.visualizations.singlevalue.afterLabel display.visualizations.singlevalue.beforeLabel display.visualizations.singlevalue.colorBy display.visualizations.singlevalue.colorMode display.visualizations.singlevalue.numberPrecision display.visualizations.singlevalue.rangeColors display.visualizations.singlevalue.rangeValues display.visualizations.singlevalue.showSparkline display.visualizations.singlevalue.showTrendIndicator display.visualizations.singlevalue.trendColorInterpretation display.visualizations.singlevalue.trendDisplayMode display.visualizations.singlevalue.trendInterval display.visualizations.singlevalue.underLabel display.visualizations.singlevalue.useColors display.visualizations.singlevalue.useThousandSeparators display.visualizations.singlevalueHeight display.visualizations.type displayview is_scheduled is_visible max_concurrent next_scheduled_time qualifiedSearch realtime_schedule request.ui_dispatch_app request.ui_dispatch_view restart_on_searchpeer_add run_n_times run_on_startup schedule_window search vsid].freeze
  end
end