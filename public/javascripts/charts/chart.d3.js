(function($){

  $.fn.Chart = function(global_data,options,margins) {
    
    var settings = $.extend( {
        'type': undefined,
        'chart_width' : undefined,
        'chart_height' : undefined
      }, options);
  
    var margin = $.extend( {
      'top': 10,
      'right': 50,
      'bottom': 30,
      'left': 50
    }, margins);

    var type = settings.type == undefined ? 'BarChart' : settings.type ;
    var chart_width = settings.chart_width == undefined ? parseInt($(this).width()) : settings.chart_width ;
    var chart_height = settings.chart_height == undefined ? parseInt($(this).width() / 2.5) : settings.chart_height ;
    var bar_width = settings.bar_width == undefined ? Math.round(parseInt(chart_width) / 24) : settings.bar_width;
    var showLegend = settings.showLegend == undefined ? true : settings.showLegend;
    var tooltips = settings.tooltips == undefined ? true : settings.tooltips;
    var showLabels = settings.showLabels == undefined ? true : settings.showLabels;
    var staggerLabels = settings.staggerLabels == undefined ? false : settings.staggerLabels;
    var formatY = settings.formatY == undefined ? 'kWh' : settings.formatY;
    var formatX = settings.formatX == undefined ? '%Y-%b-%d [%H:%M]' : settings.formatX;
    
    data = global_data;
    
    var chart;
    var element = $(this) ;
    var divId = "#" + element.attr("id");
    
    if(type == "BarChart"){
  
      chart = nv.models.discreteBarChart();
      chart.margin({top: margin.top, right: margin.right, bottom: margin.bottom, left: margin.left});
      chart.tooltips(tooltips);
      chart.staggerLabels(staggerLabels);
      chart.tooltipContent(function(key, x, y, e, graph) { return '<h3>' + key + '</h3>' + '<p>' +  y + ' - ' + x + '</p>'; });
      chart.xAxis.tickFormat(function(d) { return d3.time.format(formatX)(new Date(d)) });
      chart.yAxis.tickFormat(function(d) { if(typeof d == 'number'){ return '$' + d3.format(',.02s')(d);}else{ return d; } });
    }else if(type == "LineChart"){
  
      chart = nv.models.lineChart();
      chart.margin({top: margin.top, right: margin.right, bottom: margin.bottom, left: margin.left});
      chart.tooltips(tooltips);
      chart.color(d3.scale.category10().range());
      chart.showLegend(showLegend);
      chart.tooltipContent(function(key, x, y, e, graph) { return '<h3>' + key + '</h3>' + '<p>' +  y + ' - ' + x + '</p>'; });
      chart.xAxis.tickFormat(function(d) { return d3.time.format(formatX)(new Date(d)) });
      chart.yAxis.tickFormat(function(d) { if(formatY == '$'){ return '$' + d3.format(',.02s')(d);}else if(formatY == "%"){ return d3.format(',.1%')(d);}else{ return d + " " + formatY; } });
      //chart.noData = "Aqui va un mensaje, cuando no trae datos. REVISAR !!";
    }else if(type == "LineChartZoom"){
  
      chart = nv.models.lineWithFocusChart();
      chart.margin({top: margin.top, right: margin.right, bottom: margin.bottom, left: margin.left});
      chart.tooltips(tooltips);
      chart.showLegend(showLegend);
      chart.tooltipContent(function(key, x, y, e, graph) { return '<h3>' + key + '</h3>' + '<p>' +  y + ' - ' + x + '</p>'; });
      chart.xAxis.tickFormat(function(d) { if(typeof d == 'number'){ return d3.time.format('%b')(new Date(d)); }else{ return d; } });
      chart.yAxis.tickFormat(function(d) { if(typeof d == 'number'){ return '$' + d3.format(',.02s')(d);}else{ return d; } });
      chart.x2Axis.tickFormat(function(d) { if(typeof d == 'number'){ return d3.time.format('%b')(new Date(d)); }else{ return d; } });
      chart.y2Axis.tickFormat(function(d) { if(typeof d == 'number'){ return '$' + d3.format(',.02s')(d);}else{ return d; } });
    }else if(type == "LineAreaChart"){
      
      chart = nv.models.stackedAreaChart();
      chart.margin({top: margin.top, right: margin.right, bottom: margin.bottom, left: margin.left});
      chart.tooltips(tooltips);
      chart.showLegend(showLegend);
      chart.color(d3.scale.category10().range());
      chart.tooltipContent(function(key, x, y, e, graph) { return '<h3>' + key + '</h3>' + '<p>' +  y + ' - ' + x + '</p>'; });
      chart.xAxis.tickFormat(function(d) { return d3.time.format(formatX)(new Date(d)); });
      chart.yAxis.tickFormat(function(d) { if(formatY == '$'){ return '$' + d3.format(',.02s')(d);}else if(formatY == "%"){ return d3.format(',.1%')(d);}else{ return d + " " + formatY; } });
      
    }else if(type == "MultiBar"){
  
      chart = nv.models.multiBarChart();
      chart.margin({top: margin.top, right: margin.right, bottom: margin.bottom, left: margin.left});
      chart.reduceXTicks(false); //Hacer valor dinamico -- Es para reducir los valore en X
      chart.rotateLabels(0);
      chart.showControls(false);
      chart.color(d3.scale.category10().range());
      chart.tooltips(tooltips);
      chart.tooltipContent(function(key, x, y, e, graph) { return '<h3>' + key + '</h3>' + '<p>' +  y + ' - ' + x + '</p>'; });
      chart.xAxis.tickFormat(function(d) { return d3.time.format(formatX)(new Date(d)) });
      chart.yAxis.tickFormat(function(d) { if(formatY == '$'){ return '$' + d3.format(',.02s')(d);}else if(formatY == "%"){ return d3.format(',.1%')(d);}else{ return d + " " + formatY; } });
      chart.x(function(d) { return d.label; });
      chart.y(function(d) { return d.value; });
    }else if(type == "DountChart"){
      
      chart = nv.models.pieChart();
      chart.margin({top: margin.top, right: margin.right, bottom: margin.bottom, left: margin.left});
      chart.showLabels(showLabels);
      chart.tooltips(tooltips);
      chart.showLegend(showLegend);
      chart.tooltipContent(function(key, x, e, graph) { return '<h3>' + key + '</h3>' + '<p>' + x + '</p>'; });
    }
    
    if(type == "MultiBar"){
      d3.select(divId).append("svg:svg").datum(data).attr("width", chart_width).attr("height", chart_height).transition().duration(500).call(chart);
    }else{
      //Params Default
      chart.x(function(d) { return d.date; });
      chart.y(function(d) { return d.value; });
      d3.select(divId).append("svg:svg").datum(data).attr("width", chart_width).attr("height", chart_height).call(chart).selectAll("rect").attr("width", bar_width);
    }
    
    return chart;
  };
  
  
  
})(jQuery);
