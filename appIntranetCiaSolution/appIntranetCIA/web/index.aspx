<%@ Page Title="" Language="C#" MasterPageFile="~/web/page.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="appIntranetCIA.web.index" %>

<asp:Content ID="contectTitle" ContentPlaceHolderID="titlePage" runat="server">Home</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <script src="../Content/master/js/jquery-1.10.2.js"></script>
  





    <script>





        type = ['', 'info', 'success', 'warning', 'danger'];


        demos = {


            

            initChartist: function () {

                var dataSales = {
                    labels: ['9:00AM', '12:00AM', '3:00PM', '6:00PM', '9:00PM', '12:00PM', '3:00AM', '6:00AM'],
                    series: [
                       [287, 385, 490, 492, 554, 586, 698, 695, 752, 788, 846, 944],
                      [67, 152, 143, 240, 287, 335, 435, 437, 539, 542, 544, 647],
                      [23, 113, 67, 108, 190, 239, 307, 308, 439, 410, 410, 509]
                    ]
                };

                var optionsSales = {
                    lineSmooth: false,
                    low: 0,
                    high: 800,
                    showArea: true,
                    height: "245px",
                    axisX: {
                        showGrid: false,
                    },
                    lineSmooth: Chartist.Interpolation.simple({
                        divisor: 3
                    }),
                    showLine: false,
                    showPoint: false,
                };

                var responsiveSales = [
                  ['screen and (max-width: 840px)', {
                      axisX: {
                          labelInterpolationFnc: function (value) {
                              return value[0];
                          }
                      }
                  }]
                ];

                Chartist.Line('#chartHours', dataSales, optionsSales, responsiveSales);

                var enero = parseFloat( <%= enero %>);
                var febrero = parseFloat( <%= febrero %>);
                var marzo = parseFloat( <%= marzo %>);
                var abril = parseFloat( <%= abril %>);
                var mayo = parseFloat( <%= mayo %>);
                var junio = parseFloat( <%= junio %>);
                var julio = parseFloat( <%= julio %>);
                var agosto = parseFloat( <%= agosto %>);
                var setiembre = parseFloat( <%= setiembre %>);
                var octubre = parseFloat( <%= octubre %>);
                var noviembre = parseFloat( <%= noviembre %>);
                var diciembre = parseFloat( <%= diciembre %> );

                var data = {
                    labels: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Set', 'Oct', 'Nov', 'Dic'],
                    series: [
                      [enero,febrero,marzo,abril,mayo,junio,julio,agosto,setiembre,octubre,noviembre,diciembre]
                      
                    ]
                };

                var options = {
                    seriesBarDistance: 10,
                    axisX: {
                        showGrid: true
                    },
                    height: "275px"
                    

                };

                var responsiveOptions = [
                  ['screen and (max-width: 840px)', {
                      seriesBarDistance: 5,
                      axisX: {
                          labelInterpolationFnc: function (value) {
                              return value[0];
                          }
                      }
                  }]
                ];

                Chartist.Bar('#chartActivity', data, options, responsiveOptions);

                var dataPreferences = {
                    series: [
                        [25, 30, 20, 25]
                    ]
                };

                var optionsPreferences = {
                    donut: true,
                    donutWidth: 40,
                    startAngle: 0,
                    total: 100,
                    showLabel: false,
                    axisX: {
                        showGrid: false
                    }
                };

                Chartist.Pie('#chartPreferences', dataPreferences, optionsPreferences);

                Chartist.Pie('#chartPreferences', {
                    labels: ['60%', '4%', '46%'],
                    series: [60, 14, 26]
                });
            },

            

            


        }








    </script>
    

     <script>

        $(document).ready(function () {

           
            demos.initChartist();
            
            

        });


    </script>



    



                <div class="row">
                    <div class="col-md-6">
                        <div class="card ">
                            <div class="header">
                                <h4 class="title"><%= DateTime.Now.Year.ToString() %> Ventas</h4>
                                <p class="category">Todos los Productos Incluidos</p>
                            </div>
                            <div class="content" >
                                                                 <div id="chartActivity"  class="ct-chart"></div>

                              
                               
                            </div>
                        </div>
                    </div>

                    
                </div>




</asp:Content>
