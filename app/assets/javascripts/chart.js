
  $(function () {
    // # Place all the behaviors and hooks related to the matching controller here.
    // # All this logic will automatically be available in application.js.
    // # You can use CoffeeScript in this file: http://coffeescript.org/
    //

    new Highcharts.Chart({
        chart: {
          renderTo: "container",
          type: 'column'
        },
        title: {
            text: 'Stacked column chart'
        },
        xAxis: {
            categories: ['8/7', '8/8', '8/9', '8/10', '8/11']
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Total miles'
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                }
            }
        },
        legend: {
            align: 'right',
            x: -30,
            verticalAlign: 'top',
            y: 25,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.x + '</b><br/>' +
                    this.series.name + ': ' + this.y + '<br/>' +
                    'Total: ' + this.point.stackTotal;
            }
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true,
                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                    style: {
                        textShadow: '0 0 3px black'
                    }
                }
            }
        },
        series: [{
            name: 'Swimming',
            data: [5, 3, 4, 7, 2]
        }, {
            name: 'Biking',
            data: [2, 2, 3, 2, 1]
        }, {
            name: 'Running',
            data: [3, 4, 4, 2, 5]
        }]
      });

      new Highcharts.Chart({
          chart: {
            renderTo: "container1",
            type: 'column'
          },
          title: {
              text: 'Something '
          },
          xAxis: {
              categories: ['1/1', '2/1', '3/1', '4/1', '5/1', '6/1', '7/1', '8/1', '9/1', '10/1', '11/1', '12/1', '13/1', '14/1', '15/1']
          },
          yAxis: { // Primary yAxis
              labels: {
                  style: {
                      color: Highcharts.getOptions().colors[1]
                  }
              },
              title: {
                  text: 'Net Calories',
                  style: {
                      color: Highcharts.getOptions().colors[1]
                  }
              }
          },
          tooltip: {
              shared: true
          },
          legend: {
              align: 'right',
              x: -30,
              verticalAlign: 'top',
              y: 25,
              floating: true,
              backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
              borderColor: '#CCC',
              borderWidth: 1,
              shadow: false
          },
          tooltip: {
              formatter: function () {
                  return '<b>' + this.x + '</b><br/>' + this.series.name + ': ' + this.y + '<br/>' +
                      'Total: ' + this.point.stackTotal;
              }
          },
          plotOptions: {
              column: {
                  stacking: 'normal',
                  dataLabels: {
                      enabled: true,
                      color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                      style: {
                          textShadow: '0 0 3px black'
                      }
                  }
              }
          },
          series: [{
              name: 'calories',
              type: 'column',
              data: [20, 25, 10, 30, 80, 20, 25, 10, 30, 80, 20, 25, 10, 30, 80],
          }, {
              name: 'excercise',
              type: 'column',
              data: [-30, -0, -30, -30, -10, -30, -50, -30, -30, -10, -30, -50, -30, -30, -10]
          }, {
              name: 'Goal',
              type: 'line',
              data: [65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65],
          }]
      });

  });
