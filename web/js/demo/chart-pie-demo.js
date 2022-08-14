// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var serviceType0 = document.getElementById("serviceType0").value;
var serviceType1 = document.getElementById("serviceType1").value;
var serviceType2 = document.getElementById("serviceType2").value;
var serviceType3 = document.getElementById("serviceType3").value;
var serviceType4 = document.getElementById("serviceType4").value;
var serviceType5 = document.getElementById("serviceType5").value;
var serviceTypeName0 = document.getElementById("serviceTypeName0").value;
var serviceTypeName1 = document.getElementById("serviceTypeName1").value;
var serviceTypeName2 = document.getElementById("serviceTypeName2").value;
var serviceTypeName3 = document.getElementById("serviceTypeName3").value;
var serviceTypeName4 = document.getElementById("serviceTypeName4").value;
var serviceTypeName5 = document.getElementById("serviceTypeName5").value;
var myPieChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: [serviceTypeName0, serviceTypeName1, serviceTypeName2, serviceTypeName3, serviceTypeName4, serviceTypeName5],
        datasets: [{
                data: [serviceType0, serviceType1, serviceType2, serviceType3, serviceType4, serviceType5],
                backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '8b2bab', '#f5c842', '#42ad34'],
                hoverBackgroundColor: ['#2e59d9', '#17a673', '#2849ad', '#590675', '#c99a0c', '#157808'],
            }],
    },
    options: {
        maintainAspectRatio: false,
        tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            borderColor: '#dddfeb',
            borderWidth: 1,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            caretPadding: 10,
        },
        legend: {
            display: false
        },
        cutoutPercentage: 80,
    },
});
            