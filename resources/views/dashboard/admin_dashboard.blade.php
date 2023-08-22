@extends('layout.main')
@section('content')

<!-- Alert Section for version upgrade-->
<div id="alertSection" class="{{ $alertVersionUpgradeEnable==true ? null : 'd-none' }} alert alert-primary alert-dismissible fade show" role="alert">
    <p id="announce" class="{{ $alertVersionUpgradeEnable==true ? null : 'd-none' }}"><strong>Announce !!!</strong> A new version {{config('auto_update.VERSION')}} <span id="newVersionNo"></span> has been released. Please <i><b><a href="{{route('new-release')}}">Click here</a></b></i> to check upgrade details.</p>
    <button type="button" id="closeButtonUpgrade" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>

<!-- Alert Section for Bug update-->
<div id="alertBugSection" class=" {{ $alertBugEnable==true ? null : 'd-none' }} alert alert-primary alert-dismissible fade show" style="background-color: rgb(248,215,218)" role="alert">
    <p id="alertBug" class=" {{ $alertBugEnable==true ? null : 'd-none' }} " style="color: rgb(126,44,52)"><strong>Alert !!!</strong> Minor bug fixed in version {{env('VERSION')}}. Please <i><b><a href="{{route('bug-update-page')}}">Click here</a></b></i> to update the system.</p>
    <button type="button" style="color: rgb(126,44,52)" id="closeButtonBugUpdate" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>

<section>

    <div class="container-fluid">

        <div class="d-flex justify-content-end mb-30px">
            <button type="button" name="show" id="filed_btn" class=" mr-2 show_new btn {{ (!$field || $field->clock_in_out== 0) ? 'btn-primary' : 'btn-danger'  }}  btn-sm"><i class="dripicons-enter"></i> {{(!$field || $field->clock_in_out== 0) ? 'Field In' : 'Field Out'}}</button>
            @if (env('ENABLE_CLOCKIN_CLOCKOUT')!=NULL)
            @if(!empty($employee))
            @php
            $shift_in = $employee->officeShift->$current_day_in;
            $shift_out = $employee->officeShift->$current_day_out;
            $shift_name = $employee->officeShift->shift_name;
            @endphp
            <form class="d-inline m1-2" action="{{route('employee_attendance.post',$employee->id)}}" name="set_clocking" id="set_clocking" autocomplete="off" class="form" method="post" accept-charset="utf-8">
                @csrf

                <input type="hidden" value="{{$shift_in}}" name="office_shift_in" id="shift_in">
                <input type="hidden" value="{{$shift_out}}" name="office_shift_out" id="shift_out">
                <input type="hidden" value="" name="in_out_value" id="in_out">

                @if(!$employee_attendance || $employee_attendance->clock_in_out== 0)
                <button class="btn btn-success btn-sm" @if($employee->attendance_type=='ip_based' && $ipCheck!=true) disabled @endif type="submit" id="clock_in_btn"><i class="dripicons-enter"></i> {{__('Clock IN')}}</button>
                @else
                <button class="btn btn-danger btn-sm" @if($employee->attendance_type=='ip_based' && $ipCheck!=true) disabled @endif type="submit" id="clock_out_btn"><i class="dripicons-exit"></i> {{__('Clock OUT')}}</button>
                @endif
                {{-- <br> --}}
                @if($employee->attendance_type=='ip_based' && $ipCheck!=true) <small class="text-danger"><i>[Please login with your office's internet to clock in or clock out]</i></small> @endif
            </form>
            @endif
            @endif

        </div>

        <div class="d-flex justify-content-between mb-30px">
            <div>
                <h1 class="thin-text">{{trans('file.Welcome')}} {{auth()->user()->username}}</h1>
            </div>
            <div>
                <h4 class="thin-text">{{__('Today is')}} {{now()->englishDayOfWeek}} {{now()->format(env('Date_Format'))}}</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <div class="wrapper count-title text-center">
                    <a href="{{route('employees.index')}}">
                        <div class="name"><strong class="purple-text">{{ trans('file.Employees') }}</strong>
                        </div>
                        <div class="count-number employee-count">{{$employees->count()}}</div>
                    </a>
                </div>
            </div>

            <!-- Count item widget-->
            <div class="col-sm-2">
                <div class="wrapper count-title text-center">
                    <a href="{{route('attendances.index')}}">
                        <div class="name"><strong class="orange-text">{{trans('file.Attendance')}}</strong></div>
                        <div class="count-number attendance-count">P:{{$attendance_count}}
                            A:{{$employees->count() - $attendance_count}}</div>
                    </a>
                </div>
            </div>
            <!-- Count item widget-->
            <div class="col-sm-2">
                <div class="wrapper count-title text-center">
                    <a href="{{route('leaves.index')}}">
                        <div class="name"><strong class="green-text">{{__('Total Leave')}}</strong></div>
                        <div class="count-number leave-count">{{$leave_count}}</div>
                    </a>
                </div>
            </div>
            <!-- Count item widget-->
            <div class="col-sm-2">
                <div class="wrapper count-title text-center">
                    <a href="{{route('expense.index')}}">
                        <div class="name"><strong class="blue-text">{{__('Total Expense')}}</strong></div>
                        <div class="count-number total_expense"> {{$total_expense}}</div>
                        {{-- <div class="count-number total_expense"> {{number_format((float)$total_expense, 2, '.', '') }}
                </div> --}}
                </a>
            </div>
        </div>

        <div class="col-sm-2">
            <div class="wrapper count-title text-center">
                <a href="{{route('deposit.index')}}">
                    <div class="name"><strong class="green-text">{{__('Total Deposit')}}</strong></div>
                    <div class="count-number total_deposit">{{$total_deposit}}</div>
                </a>
            </div>
        </div>
        <!-- Count item widget-->
        <div class="col-sm-2">
            <div class="wrapper count-title text-center">
                <a href="{{route('payment_history.index')}}">
                    <div class="name"><strong class="blue-text">{{__('Total Salaries Paid')}}</strong>
                    </div>
                    <div class="count-number total_salaries_paid">{{$total_salaries_paid}}</div>
                </a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8 mt-4">
            <div class="card mb-0">
                <div class="card-header d-flex align-items-center">
                    <h4>{{trans('file.Payment')}} --- {{__('Last 6 Months ')}}</h4>
                </div>
                <div class="card-body">
                    <canvas id="payment_last_six" data-last_six_month_payment="{{json_encode($per_month_payment) ?? ''}}" data-months="{{json_encode($per_month) ?? ''}}" data-label1="{{trans('file.Payment')}}"></canvas>
                </div>
            </div>
        </div>

        <div class="col-md-4 mt-4">
            <div class="card mb-0">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>{{__('Employee Department')}}</h4>
                </div>
                <div class="pie-chart mb-2">
                    <canvas id="department_chart" data-dept_bgcolor='@json($dept_bgcolor_array)' data-hover_dept_bgcolor='@json($dept_hover_bgcolor_array)' data-dept_emp_count='@json($dept_count_array)' data-dept_label='@json($dept_name_array)' width="100" height="95"></canvas>
                </div>
            </div>
        </div>

        <div class="col-md-4 mt-4">
            <div class="card mb-0">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>{{__('Employee Designation')}}</h4>
                </div>
                <div class="pie-chart mb-2">
                    <canvas id="designation_chart" data-desig_bgcolor='@json($desig_bgcolor_array)' data-hover_desig_bgcolor='@json($desig_hover_bgcolor_array)' data-desig_emp_count='@json($desig_count_array)' data-desig_label='@json($desig_name_array)' width="100" height="95"></canvas>
                </div>
            </div>
        </div>

        <div class="col-md-4 mt-4">
            <div class="card mb-0">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>{{__('Expense Vs Deposit')}}</h4>
                </div>
                <div class="pie-chart mb-2">
                    <canvas id="expense_deposit_chart" data-expense_count='{{$total_expense_raw}}' data-expense_level="{{trans('Expense')}}" data-deposit_count='{{$total_deposit_raw}}' data-deposit_level="{{trans('Deposit')}}" width="100" height="95"></canvas>
                </div>
            </div>
        </div>

        <div class="col-md-4 mt-4">
            <div class="card mb-0">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>{{__('Project Status')}}</h4>
                </div>
                <div class="pie-chart mb-2">
                    <canvas id="project_chart" data-project_status='@json($project_count_array)' data-project_label='@json($project_name_array)' width="100" height="95"></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-4 mt-4">
            <div class="wrapper count-title d-flex">
                <div class="icon blue-text ml-2 mr-3"><i class="dripicons-volume-medium"></i></div>
                <a href="{{route('announcements.index')}}">
                    <h3 class="mt-3">{{ count($announcements) }} {{trans('file.Announcement')}}</h3>
                </a>
            </div>
        </div>
        <div class="col-4 mt-4">
            <div class="wrapper count-title d-flex">
                <div class="icon green-text ml-2 mr-3"><i class="dripicons-ticket"></i></div>
                <a href="{{route('tickets.index')}}">
                    <h3 class="mt-3">{{$ticket_count}} {{__('Open Ticket')}}</h3>
                </a>
            </div>
        </div>
        <div class="col-4 mt-4">
            <div class="wrapper count-title d-flex">
                <div class="icon orange-text ml-2 mr-3"><i class="dripicons-briefcase"></i></div>
                <a href="{{route('projects.index')}}">
                    <h3 class="mt-3">{{$completed_projects}} {{__('Completed Projects')}}</h3>
                </a>
            </div>
        </div>
    </div>

    <div class="row">
        @include('calendarable.calendar')
    </div>
    </div>

</section>

<div id="formModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title">Fiels</h5>
                <button type="button" data-dismiss="modal" id="close" aria-label="Close" class="close"><i class="dripicons-cross"></i></button>
            </div>
            <form class="d-inline m1-2" action="{{route('employee_attendance.field',$employee->id)}}" name="set_clocking" id="set_clocking" autocomplete="off" class="form" method="post" accept-charset="utf-8" enctype="multipart/form-data">

                <div class="modal-body">
                    @csrf
                    @if(!$field || $field->clock_in_out== 0)
                    <div class="row">
                        <div class="col-md-12">
                            <div id="results">Your captured image will appear here...</div>
                        </div>

                        <input type="hidden" name="latitude" id="latitude">
                        <input type="hidden" name="longitude" id="longitude">

                        <div class="col-md-12 form-group">
                            <button class="btn bnt-default btn-block" type="button" id="take_shot">Take Snapshot</button>
                            <input type="hidden" name="image" class="image-tag">
                        </div>

                    </div>
                    @endif


                    <input type="hidden" value="{{ (!$field || $field->clock_in_out== 0) ?  ''  : $field->id  }}" name="field_id" id="field_id">
                </div>
                <div class="modal-footer">
                    @if(!$field || $field->clock_in_out== 0)
                    <button class="btn btn-success btn-sm" type="submit" id="clock_in_btn"><i class="dripicons-enter"></i> Field In</button>
                    @else
                    <button class="btn btn-danger btn-sm" type="submit" id="clock_out_btn"><i class="dripicons-exit"></i> Field Out</button>
                    @endif


                    <button type="button" class="btn btn-default" data-dismiss="modal">{{trans('file.Close')}}</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div id="divice_shot" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title">Fiels</h5>
                <button type="button" data-dismiss="modal" id="close" aria-label="Close" class="close"><i class="dripicons-cross"></i></button>
            </div>

            <div class="modal-body">

                <div class="row">

                    <div class="col-md-12">
                        <div id="my_camera"></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <input type="button" value="Take Snapshot" onClick="take_snapshot()">
                <button type="button" class="btn btn-default" data-dismiss="modal">{{trans('file.Close')}}</button>
            </div>

        </div>
    </div>
</div>
@endsection




@push('scripts')
<script>
    let clientCurrrentVersion = {
        !!json_encode(env("VERSION")) !!
    };
    let clientCurrrentBugNo = {
        !!json_encode(env("BUG_NO")) !!
    };
</script>
<script type="text/javascript" src="{{asset('js/admin/common/general_data.js')}}"></script>
<script type="text/javascript" src="{{asset('js/admin/dashboard/notification.js')}}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/webcamjs/1.0.25/webcam.min.js"></script>
<script>
    $('#filed_btn').on('click', function() {
        $('#formModal').modal('show');


        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            alert("Geolocation is not supported by this browser.");
        }

    });
    $('#take_shot').on('click', function() {
        $('#divice_shot').modal('show');
        Webcam.set({
            width: 350,
            height: 350,
            image_format: 'jpeg',
            jpeg_quality: 90
        });

        Webcam.attach('#my_camera');
    });

    function take_snapshot() {

        Webcam.snap(function(data_uri) {
            $(".image-tag").val(data_uri);
            document.getElementById('results').innerHTML = '<img src="' + data_uri + '"/>';
        });
        Webcam.reset();
        $('#divice_shot').modal('hide');
    }

    function showPosition(position) {
        $('#longitude').val(position.coords.longitude)
        $('#latitude').val(position.coords.latitude)

    }
</script>
@endpush