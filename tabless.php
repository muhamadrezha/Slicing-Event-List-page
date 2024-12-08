<?php
// Koneksi ke database
$host = 'localhost';
$user = 'root';
$password = '';
$dbname = 'test';

$conn = new mysqli($host, $user, $password, $dbname);

// Periksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Default query
$sql = "SELECT Time, Room, Company, Event, Type, Setup, Pax, EO_No, Mgr FROM events";

// Menangani pencarian
if (isset($_GET['table_search']) && !empty($_GET['table_search'])) {
    $searchTerm = $conn->real_escape_string($_GET['table_search']);
    $sql .= " WHERE Company LIKE '%$searchTerm%' OR Event LIKE '%$searchTerm%' OR Mgr LIKE '%$searchTerm%'";
}

// Menangani submit form untuk filter tanggal
if (isset($_GET['startDate']) && isset($_GET['endDate'])) {
    $startDate = $_GET['startDate'];
    $endDate = $_GET['endDate'];

    if (!empty($startDate) && !empty($endDate)) {
        $sql .= " AND Time BETWEEN '$startDate' AND '$endDate'";
    }
}

$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Events Table</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="tabel/all.min.css">
    <link rel="stylesheet" href="tabel/adminlte.min.css">
    <link rel="stylesheet" href="tabel/bootstrap-4.min.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
    <div class="container mt-3 card">
        <h4 class="text-center mb-4 mt-3"><b>Calendar of Events</b></h4>
        <form method="GET" action="">
            <div class="form-row">
                <div class="form-group col-md-3">
                    <label>Date range:</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="bx bxs-calendar"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control float-right" id="reservation" value="Date range">
                    </div>
                    <!-- /.input group -->
                </div>
                <div class="form-group col-md-2.5">
                    <label for="room">In</label>
                    <select class="form-control" id="room" name="room">
                        <option value="All" selected>All Rooms</option>
                        <option value="Room1">Planary Hall Area</option>
                        <option value="Room2">Assembly Halls</option>
                        <option value="Room3">Cendrawasih Rooms</option>
                        <option value="Room3">Lowe Level Area</option>
                        <option value="Room3">Exhibition Halls Area</option>
                    </select>
                </div>
                <div class="form-group col-md-4.5">
                    <label for="eventType">Of</label>
                    <select class="form-control" id="eventType" name="eventType">
                        <option value="All">All types</option>
                        <option value="Conference">Meeting, Conference and Convention</option>
                        <option value="Meeting">Wedding and Other Food and Beverage Event</option>
                        <option value="Workshop">Concert and Other Stage Performance</option>
                        <option value="Workshop">Product Launch</option>
                        <option value="Workshop">Graduation and Other Education Event</option>
                        <option value="Workshop">Exhibition ( Consumen, Trade and Industrial Show )</option>
                        <option value="Workshop">Religion Service</option>
                        <option value="Workshop">Other</option>
                    </select>
                </div>
                <div class="form-group col-md-2">
                    <label for="reportTitle">Calendar Title</label>
                    <input type="text" class="form-control" id="reportTitle" name="reportTitle" value="Calendar of Events">
                </div>
            </div>

            <div class="form-group">
                <div class="row mt-1">
                    <div class="col-md-3 ml-3">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="includeTentative" name="includeTentative">
                            <label class="form-check-label" for="includeTentative">Including tentative events</label>
                        </div>

                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="includeProspect" name="includeProspect">
                            <label class="form-check-label" for="includeProspect">Include prospect events</label>
                        </div>

                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="excludeSmallRooms" name="excludeSmallRooms">
                            <label class="form-check-label" for="excludeSmallRooms">Do not display small rooms</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="useEventName" name="useEventName">
                            <label class="form-check-label" for="useEventName">Use event name instead of booking name</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="includeSetUp" name="includeSetUp">
                            <label class="form-check-label" for="includeSetUp">Including set-up, breakdown, floor marking, etc.</label>
                        </div>
                    </div>
                    <div class="col-md-2 mt-4 ml-5">
                        <button type="reset" class="btn btn-secondary">Reset</button>
                        <button type="submit" class="btn btn-primary mr-2">Submit</button>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0"><b>Event List</b></h5>
                    <div class="card-tools">
                        <form method="GET" action="">
                            <div class="input-group input-group-sm" style="width: 250px;">
                                <input type="text" name="table_search" class="form-control float-right" placeholder="Search" value="<?php echo isset($_GET['table_search']) ? htmlspecialchars($_GET['table_search']) : ''; ?>">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-default">
                                        <i class="bx bx-search-alt-2"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card-body table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>Time</th>
                                <th>Room</th>
                                <th>Company</th>
                                <th>Event</th>
                                <th>Type</th>
                                <th>Setup</th>
                                <th>Pax</th>
                                <th>EO#</th>
                                <th>Mgr.</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if ($result->num_rows > 0) {
                                while ($row = $result->fetch_assoc()) {
                                    echo "<tr>
                                        <td>{$row['Time']}</td>
                                        <td>{$row['Room']}</td>
                                        <td>{$row['Company']}</td>
                                        <td>{$row['Event']}</td>
                                        <td>{$row['Type']}</td>
                                        <td>{$row['Setup']}</td>
                                        <td>{$row['Pax']}</td>
                                        <td>{$row['EO_No']}</td>
                                        <td>{$row['Mgr']}</td>
                                    </tr>";
                                }
                            } else {
                                echo "<tr><td colspan='9' class='text-center'>No data available</td></tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Include necessary styles and scripts for Date Range Picker -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css">
    <script src="https://cdn.jsdelivr.net/npm/moment/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#reservation').daterangepicker({
                locale: {
                    format: 'YYYY-MM-DD', // Format tanggal yang digunakan
                    cancelLabel: 'Clear' // Label untuk tombol Clear
                },
                autoUpdateInput: false, // Input hanya diperbarui saat pengguna memilih rentang
                showDropdowns: true, // Menambahkan dropdown untuk memilih bulan dan tahun
            });

            // Tambahkan event listener untuk input
            $('#reservation').on('apply.daterangepicker', function(ev, picker) {
                $(this).val(picker.startDate.format('YYYY-MM-DD') + ' - ' + picker.endDate.format('YYYY-MM-DD'));
            });

            $('#reservation').on('cancel.daterangepicker', function(ev, picker) {
                $(this).val(''); // Kosongkan input jika dibatalkan
            });
        });
    </script>

</body>

</html>