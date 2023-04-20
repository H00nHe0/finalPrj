
                    var ctx1 = document.querySelector('#stick-chart').getContext('2d');
                    var chart1 = new Chart(ctx1, {
                      type: 'bar',
                      data: {
                        labels: ['1월', '2월', '3월', '4월', '5월', '6월'],
                        datasets: [{
                          label: '월간 방문자 수',
                          backgroundColor: 'rgb(130, 203, 196)',
                          borderColor: 'rgb(255, 99, 132)',
                          data: [500, 1000, 750, 1200, 900, 1500],
                          barThickness: 30,
                        }]
                      },
                      options: {
                        responsive: true,
                        maintainAspectRatio: false
                      }
                    });
                    const ctx2 = document.querySelector('#circle-chart').getContext('2d');
                    const chart2 = new Chart(ctx2, {
                    type: 'pie',
                    data: {
                        labels: ['내과', '외과', '소아과', '치과'],
                        datasets: [{
                        label: '진료과별 월간 내원자 수',
                        backgroundColor: [
                            'rgb(255, 99, 132)',
                            'rgb(54, 162, 235)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)'
                        ],
                        borderColor: 'white',
                        data: [1200, 800, 500, 1000]
                        }]
                    },
                    options: {

                    }
                    });