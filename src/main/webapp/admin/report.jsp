<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .card-icon {
            font-size: 2em;
        }
        .card {
            margin-bottom: 20px;
        }
        .chart-container {
            width: 100%;
            height: 400px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card text-white bg-primary">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title">Total Slots</h5>
                                <p class="card-text">1000</p>
                            </div>
                            <div class="card-icon">
                                <i class="fas fa-parking"></i>
                            </div>
                        </div>
                        <p class="card-text"><small>+10% since last month</small></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-white bg-success">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title">Total Cars</h5>
                                <p class="card-text">2300</p>
                            </div>
                            <div class="card-icon">
                                <i class="fas fa-car"></i>
                            </div>
                        </div>
                        <p class="card-text"><small>+3% since last week</small></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-white bg-warning">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title">Earned Amount</h5>
                                <p class="card-text">$53,000</p>
                            </div>
                            <div class="card-icon">
                                <i class="fas fa-dollar-sign"></i>
                            </div>
                        </div>
                        <p class="card-text"><small>+55% since yesterday</small></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-12">
                <select id="monthSelect" class="form-control">
                    <option value="0">January</option>
                    <option value="1">February</option>
                    <option value="2">March</option>
                    <option value="3">April</option>
                    <option value="4">May</option>
                    <option value="5">June</option>
                    <option value="6">July</option>
                    <option value="7">August</option>
                    <option value="8">September</option>
                    <option value="9">October</option>
                    <option value="10">November</option>
                    <option value="11">December</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="chart-container">
                    <canvas id="barChart"></canvas>
                </div>
            </div>
            <div class="col-md-6">
                <div class="chart-container">
                    <canvas id="pieChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
        var barChartData = {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            datasets: [{
                label: 'Sales Overview',
                data: [120, 190, 300, 500, 200, 300, 450, 400, 320, 600, 700, 500],
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        };

        var pieChartData = {
            labels: ['Category 1', 'Category 2', 'Category 3'],
            datasets: [{
                data: [300, 50, 100],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)'
                ],
                borderWidth: 1
            }]
        };

        var ctxBar = document.getElementById('barChart').getContext('2d');
        var barChart = new Chart(ctxBar, {
            type: 'bar',
            data: barChartData,
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

        var ctxPie = document.getElementById('pieChart').getContext('2d');
        var pieChart = new Chart(ctxPie, {
            type: 'pie',
            data: pieChartData,
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });

        document.getElementById('monthSelect').addEventListener('change', function() {
            var monthIndex = this.value;
            var newBarData = [120, 190, 300, 500, 200, 300, 450, 400, 320, 600, 700, 500]; // Adjust with actual data per month
            var newPieData = [300, 50, 100]; // Adjust with actual data per month

            barChart.data.datasets[0].data = newBarData.map((data, index) => index === parseInt(monthIndex) ? data : 0);
            pieChart.data.datasets[0].data = newPieData; // Adjust based on monthIndex if necessary

            barChart.update();
            pieChart.update();
        });
    </script>
</body>
</html>
