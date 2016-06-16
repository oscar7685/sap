<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<script type="text/javascript">
    $(function() {
        var chart2;

        chart2 = new Highcharts.Chart({
            chart: {
                renderTo: 'container${preguntaX.id}',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: null
            },
            subtitle: {
                text: '${preguntaX.pregunta}'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        color: '#000000',
                        connectorColor: '#000000',
                        formatter: function() {
                            var igv = this.percentage;
                            igv = igv.toFixed(2);
                            return '<b>' + this.point.name + '</b>: ' + igv + ' %';
                        }
                    }
                }
            },
            tooltip: {
                formatter: function() {
                    return '' +
                            this.point.name + ': ' + this.y + ' personas';
                }
            },
            series: [{
                    type: 'pie',
                    name: 'Personas',
                    data: [
                        ['0', ${ceros}],
                        ['1', ${unos}],
                        ['2', ${dos}],
                        ['3', ${tres}],
                        ['4', ${cuatros}],
                        {
                            name: '5',
                            y: ${cincos},
                            sliced: true,
                            selected: true
                        }
                    ]
                }]
        });

    });

</script>

<div id="container${preguntaX.id}" style="min-width: 850px; height: 400px; margin: 0 auto"></div>