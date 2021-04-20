/* global Chart:false */

$(function () {
  'use strict'


  var ticksStyle = {
    fontColor: '#495057',
    fontStyle: 'bold'
  }

  var mode = 'index'
  var intersect = true

  var $salesChart = $('#sales-chart')
  // eslint-disable-next-line no-unused-vars
  var settings2 = {
    "url": "/home/HimproTodayService",
    "method": "GET",
    "timeout": 0,
  };

  $.ajax(settings2).done(function (response) {
    console.log(response);
    var total = 0;
    for (var i = 0; i < response.service.length; i++) {
      total += response.service[i];
    }
    document.getElementById("serviceTotal").innerHTML = total;
    var salesChart = new Chart($salesChart, {
      type: 'bar',
      data: {
        labels: response.header,
        datasets: [
          {
            backgroundColor: '#007bff',
            borderColor: '#007bff',
            data: response.service
          },
          {
            backgroundColor: '#4CAF50',
            borderColor: '#4CAF50',
            data: response.vacc
          }
        ]
      },
      options: {
        maintainAspectRatio: false,
        tooltips: {
          mode: mode,
          intersect: intersect
        },
        hover: {
          mode: mode,
          intersect: intersect
        },
        legend: {
          display: false
        },
        scales: {
          yAxes: [{
            // display: false,
            gridLines: {
              display: true,
              lineWidth: '4px',
              color: 'rgba(0, 0, 0, .2)',
              zeroLineColor: 'transparent'
            },
            ticks: $.extend({
              beginAtZero: true,

              // Include a dollar sign in the ticks
              callback: function (value) {
                if (value >= 1000) {
                  value /= 1000
                  value += 'k'
                }

                return value
              }
            }, ticksStyle)
          }],
          xAxes: [{
            display: true,
            gridLines: {
              display: false
            },
            ticks: ticksStyle
          }]
        }
      }
    })
  });


  var settings = {
    "url": "/home/coviddata",
    "method": "GET",
    "timeout": 0,
  };
  var covidData;

  $.ajax(settings).done(function (response) {
    console.log(response);
    covidData = response;
    console.log(covidData.header)
    var visitorsChart = new Chart($visitorsChart, {
      data: {
        labels: response.header,
        datasets: [{
          type: 'line',
          data: response.new,
          backgroundColor: 'transparent',
          borderColor: '#007bff',
          pointBorderColor: '#007bff',
          pointBackgroundColor: '#007bff',
          fill: false
          // pointHoverBackgroundColor: '#007bff',
          // pointHoverBorderColor    : '#007bff'
        },
        {
          type: 'line',
          data: response.recover,
          backgroundColor: 'tansparent',
          borderColor: '#4CAF50',
          pointBorderColor: '#4CAF50',
          pointBackgroundColor: '#4CAF50',
          fill: false
          // pointHoverBackgroundColor: '#ced4da',
          // pointHoverBorderColor    : '#ced4da'
        }]
      },
      options: {
        maintainAspectRatio: false,
        tooltips: {
          mode: mode,
          intersect: intersect
        },
        hover: {
          mode: mode,
          intersect: intersect
        },
        legend: {
          display: false
        },
        scales: {
          yAxes: [{
            // display: false,
            gridLines: {
              display: true,
              lineWidth: '4px',
              color: 'rgba(0, 0, 0, .2)',
              zeroLineColor: 'transparent'
            },
            ticks: $.extend({
              beginAtZero: true,
              suggestedMax: 200
            }, ticksStyle)
          }],
          xAxes: [{
            display: true,
            gridLines: {
              display: false
            },
            ticks: ticksStyle
          }]
        }
      }
    })
  });
  var $visitorsChart = $('#visitors-chart')
  // eslint-disable-next-line no-unused-vars


})

// lgtm [js/unused-local-variable]
