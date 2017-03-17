window.Application ||= {}

class Application.BiOlap

  constructor: (data) ->

    @data   = data
    @chart  = null

  startAjax: () ->
    $('body').css 'opacity', '0.5'
    $(".spinner").show()
    return

  stopAjax: () ->
    $(".spinner").hide()
    $('body').css 'opacity', '1'
    return

  region_selection: () ->

    row     = olap.chart.getSelection()[0].row + 1
    country = olap.data[row][0]
    olap.list_country_markers(country)
    return

  draw: () ->
    google.charts.load('current', {'packages':['geochart']})
    google.charts.setOnLoadCallback(@draw_countries)
    return

  markers:(country, manufacturer) ->
    @startAjax()
    $.ajax(
      {
        type: "GET",
        url: "/home/list",
        data: {country: country, manufacturer: manufacturer},
        contentType: "application/html",
        dataType: "html"
      }).done( (response) ->
      $("##{manufacturer.replace(' ','')}").html(response)
      olap.stopAjax()
      return
    )
    return

  draw_countries: () ->

    olap.startAjax()
    chart_data = google.visualization.arrayToDataTable(olap.data)
    options = {}

    olap.chart = new google.visualization.GeoChart(document.getElementById('regions_div'))
    olap.chart.draw(chart_data, options)
    google.visualization.events.addListener(olap.chart, 'select', olap.region_selection)
    olap.stopAjax()
    return

  list_country_markers: (country) ->

    @startAjax()
    $.ajax(
      {
        type: "GET",
        url: "/home/show",
        data: {country: country},
        contentType: "application/html",
        dataType: "html"
      }).done( (response) ->
        $('#stats').html(response)
        olap.stopAjax()
        return
      )
    return
