@extends('layout.main')
@section('content')


<section>
    <div class="container-fluid mb-3">
        <button type="button" class="btn btn-info" name="workflow_leaves" id="workflow_leaves"><i class="fa fa-plus"></i> Leaves Workflow</button>

    </div>
    <div class="container-fluid mb-3">

        <div class="table-responsive">
            <table id="leave-table" class="table ">
                <thead>
                    <tr>
                        <th>Company </th>
                        <th>1st Approver</th>
                        <th>2nd Approver</th>
                        <th>3rd Approver</th>
                        <th>4th Approver</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($workflows as $w)
                    <tr>
                        <td>{{ $w->company_name }}</td>
                        <td>{{ $w->approver_1st }}</td>
                        <td>{{ $w->approver_2nd }}</td>
                        <td>{{ $w->approver_3rd }}</td>
                        <td>{{ $w->approver_4th }}</td>
                        <td>
                            <button type="button" name="edit" id="{{$w->id}}" class="edit btn btn-primary btn-sm"><i class="dripicons-pencil"></i></button>
                            <button type="button" name="delete" id="{{$w->id}}" class="delete btn btn-danger btn-sm"><i class="dripicons-trash"></i></button>
                        </td>
                    </tr>

                    @endforeach
                </tbody>

            </table>
        </div>
    </div>

</section>

<div id="formModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title">{{__('Add Assets')}}</h5>
                <button type="button" data-dismiss="modal" id="close" aria-label="Close" class="close"><i class="dripicons-cross"></i></button>
            </div>

            <div class="modal-body">
                <span id="form_result"></span>
                <form method="post" action="{{ route('leave_workflow') }}" id="sample_form" class="form-horizontal" enctype="multipart/form-data">

                    @csrf
                    <div class="row">

                        <div class="col-md-12 form-group">
                            <label>Code *</label>
                            <input type="text" name="code" " required class=" form-control" placeholder="Code">
                        </div>


                        <div class="col-md-12 form-group">
                            <label>Description *</label>
                            <input type="text" name="description" class="form-control" placeholder="Description">
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-bold">{{trans('file.Company')}} <span class="text-danger">*</span></label>
                                <select name="company_id" id="company_id" required class="form-control selectpicker dynamic company_id" data-live-search="true" data-live-search-style="contains" data-shift_name="shift_name" data-dependent="department_name" title="{{__('Selecting',['key'=>trans('file.Company')])}}...">
                                    @foreach($companies as $company)
                                    <option value="{{$company->id}}">{{$company->company_name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="col-md-12 form-group">
                            <label class="text-bold">1st Approver</label>
                            <select name="approver_1st" class="selectpicker form-control" data-live-search="true" data-live-search-style="contains" title="{{__('Selecting',['key'=>'1st Approver '])}}...">
                                <option value="line_manager">Line Manager</option>
                            </select>
                        </div>

                        <div class="col-md-12 form-group">
                            <label class="text-bold">2nd Approver</label>
                            <select name="approver_2nd" id="approver_2nd" class="selectpicker form-control company_descition" data-live-search="true" data-live-search-style="contains" title="{{__('Selecting',['key'=>'2nd Approver '])}}...">

                            </select>
                        </div>

                        <div class="col-md-12 form-group">
                            <label class="text-bold">3rd Approver</label>
                            <select name="approver_3rd" class="selectpicker form-control company_descition" data-live-search="true" data-live-search-style="contains" title="{{__('Selecting',['key'=>'3rd Approver '])}}...">

                            </select>
                        </div>

                        <div class="col-md-12 form-group">
                            <label class="text-bold">1st Approver</label>
                            <select name="approver_4th" class="selectpicker form-control company_descition" data-live-search="true" data-live-search-style="contains" title="{{__('Selecting',['key'=>'14th Approver '])}}...">

                            </select>
                        </div>


                        <div class="container">
                            <div class="form-group" align="center">
                                <input type="submit" name="action_button" id="action_button" class="btn btn-warning" value={{trans('file.Add')}}>
                            </div>
                        </div>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>

<div id="editModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title">{{__('Add Assets')}}</h5>
                <button type="button" data-dismiss="modal" id="close" aria-label="Close" class="close"><i class="dripicons-cross"></i></button>
            </div>

            <div class="modal-body">
                <span id="form_result"></span>
                <form method="post" action="{{ route('workflow.update') }}" id="sample_form" class="form-horizontal" enctype="multipart/form-data">

                    @csrf
                    <div class="row">
                        <input type="hidden" name="work_flow_id" id="work_flow_id">
                        <div class="col-md-12 form-group">
                            <label>Code *</label>
                            <input type="text" name="code" id="code" required class="form-control" placeholder="Code">
                        </div>


                        <div class="col-md-12 form-group">
                            <label>Description *</label>
                            <input type="text" name="description" id="description" class="form-control" placeholder="Description">
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-bold">{{trans('file.Company')}} <span class="text-danger">*</span></label>
                                <select name="company_id" id="company_id_2" required class="form-control selectpicker dynamic" data-live-search="true" data-live-search-style="contains" data-shift_name="shift_name" data-dependent="department_name" title="{{__('Selecting',['key'=>trans('file.Company')])}}...">
                                    @foreach($companies as $company)
                                    <option value="{{$company->id}}">{{$company->company_name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="col-md-12 form-group">
                            <label class="text-bold">1st Approver</label>
                            <select name="approver_1st" id="approver_1st" class="selectpicker form-control" data-live-search="true" data-live-search-style="contains" title="{{__('Selecting',['key'=>'1st Approver '])}}...">
                                <option value="line_manager">Line Manager</option>
                            </select>
                        </div>

                        <div class="col-md-12 form-group">
                            <label class="text-bold">2nd Approver</label>
                            <select name="approver_2nd" id="approver_2nd_2" class="selectpicker form-control company_descition" data-live-search="true" data-live-search-style="contains" title="{{__('Selecting',['key'=>'2nd Approver '])}}...">

                            </select>
                        </div>

                        <div class="col-md-12 form-group">
                            <label class="text-bold">3rd Approver</label>
                            <select name="approver_3rd" id="approver_3rd" class="selectpicker form-control company_descition" data-live-search="true" data-live-search-style="contains" title="{{__('Selecting',['key'=>'3rd Approver '])}}...">

                            </select>
                        </div>

                        <div class="col-md-12 form-group">
                            <label class="text-bold">1st Approver</label>
                            <select name="approver_4th" id="approver_4th" class="selectpicker form-control company_descition" data-live-search="true" data-live-search-style="contains" title="{{__('Selecting',['key'=>'14th Approver '])}}...">

                            </select>
                        </div>


                        <div class="container">
                            <div class="form-group" align="center">
                                <input type="submit" name="action_button" id="action_button" class="btn btn-warning" value={{trans('file.Add')}}>
                            </div>
                        </div>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>

<div id="confirmModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">{{trans('file.Confirmation')}}</h2>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <h4 align="center">{{__('Are you sure you want to remove this data?')}}</h4>
            </div>
            <div class="modal-footer">
                <button type="button" name="ok_button" id="ok_button" class="btn btn-danger">{{trans('file.OK')}}'
                </button>
                <button type="button" class="close btn-default" data-dismiss="modal">{{trans('file.Cancel')}}</button>
            </div>
        </div>
    </div>
</div>

@endsection

@push('scripts')
<script type="text/javascript">
    $('#workflow_leaves').on('click', function() {

        $('.modal-title').text('Leave WorkFlow');
        $('#action_button').val('{{trans("file.Add")}}');
        $('#action').val('{{trans("file.Add")}}');
        $('#asset_logo').html('');
        $('#asset_logo_link').html('');
        $('#formModal').modal('show');
    });

    $(document).on('click', '.edit', function() {

        let id = $(this).attr('id');

        $('#editModal').modal('show');
        let target = "edit/" + id;

        $.ajax({
            url: target,
            dataType: "json",
            success: function(html) {

                $('#work_flow_id').val(html.data.id);
              
                $('#code').val(html.data.code);
                $('#description').val(html.data.description);
                $('#company_id_2').selectpicker('val', html.data.company_id);
                $('#approver_1st').selectpicker('val', html.data.approver_1st);
               
                let all_departments = '';
                $.each(html.designation, function(index, value) {
                    all_departments += '<option value=' + value['id'] + '>' + value['designation_name'] + '</option>';
                });
                
                $('#approver_2nd_2').empty().append(all_departments);
                $('#approver_2nd_2').selectpicker('refresh');
                $('#approver_2nd_2').selectpicker('val', html.data.approver_2nd);
                $('#approver_2nd_2').selectpicker('refresh');

                $('#approver_3rd').empty().append(all_departments);
                $('#approver_3rd').selectpicker('refresh');
                $('#approver_3rd').selectpicker('val', html.data.approver_3rd);
                $('#approver_3rd').selectpicker('refresh');

                $('#approver_4th').empty().append(all_departments);
                $('#approver_4th').selectpicker('refresh');
                $('#approver_4th').selectpicker('val', html.data.approver_4th);
                $('#approver_4th').selectpicker('refresh');

            }
        })
    });

    $('.dynamic').change(function() {

        if ($(this).val() !== '') {
            let value = $('#company_id').val();

            let dependent = $(this).data('line_manager');
            let _token = $('input[name="_token"]').val();

            $.ajax({
                url: "{{ route('company_designation') }}",
                method: "POST",
                data: {
                    value: value,
                    _token: _token,
                    dependent: dependent
                },
                success: function(result) {
                    $('select').selectpicker("destroy");
                    $('.company_descition').html(result);
                    $('select').selectpicker();

                }
            });
        }
    });

    $('.dynamic').change(function() {
        let value = $('#company_id_2').val();
        get_dynimic_companyies(value)
    });
    let delete_id;
    $(document).on('click', '.delete', function() {

        delete_id = $(this).attr('id');
        $('#confirmModal').modal('show');
        $('.modal-title').text('DELETE Record');
        $('#ok_button').text('OK');

    });

    $('#ok_button').on('click', function() {
        let target = 'delete/' + delete_id;
        $.ajax({
            url: target,
            beforeSend: function() {
                $('#ok_button').text('Deleting...');
            },
            success: function(data) {
                let html = '';
                if (data.success) {
                    html = '<div class="alert alert-success">' + data.success + '</div>';
                }
                if (data.error) {
                    html = '<div class="alert alert-danger">' + data.error + '</div>';
                }
                setTimeout(function() {
                    $('#general_result').html(html).slideDown(300).delay(5000).slideUp(300);
                    $('#confirmModal').modal('hide');
                    window.refress
                }, 2000);
            }
        })
    });

    function get_dynimic_companyies(company_id) {

        let value = company_id //$('#company_id_2').val();
        console.log(value);
        let dependent = $(this).data('line_manager');
        let _token = $('input[name="_token"]').val();

        $.ajax({
            url: "{{ route('company_designation') }}",
            method: "POST",
            data: {
                value: value,
                _token: _token,
                dependent: dependent
            },
            success: function(result) {

                $('select').selectpicker("destroy");
                $('.company_descition').html(result);
                $('select').selectpicker();

            }
        });

    }
</script>

@endpush