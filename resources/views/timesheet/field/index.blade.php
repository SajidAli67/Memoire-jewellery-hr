@extends('layout.main')
@section('content')

<section>
    <div class="container-fluid">
        <div class="card mb-4">
            <div class="card-header with-border">
                <h3 class="card-title text-center"> Field </h3>
            </div>

        </div>
    </div>

    <div class="table-responsive">
        <table id="date_wise_attendance-table" class="table ">
            <thead>
                <tr>
                    <th></th>
                    <th>{{trans('file.Employee')}}</th>
                    <th>{{trans('file.Date')}}</th>
                    <th>{{__('Clock In')}}</th>
                    <th>{{__('Clock Out')}}</th>
                    <th>Location</th>
                    <th>Img</th>
                </tr>
            </thead>

        </table>
    </div>

</section>




<script type="text/javascript">
    let table_table = $('#date_wise_attendance-table').DataTable({
        responsive: true,
        fixedHeader: {
            header: true,
            footer: true
        },
        processing: true,
        serverSide: true,
        ajax: {
            url: "{{ route('field.index') }}",
            data: {

            }
        },

        columns: [{
                data: null,
                orderable: false,
                searchable: false
            },
            {
                data: 'employee_name',
                name: 'employee_name'
            },
           
            {
                data: 'date',
                name: 'date',
            },
           
            {
                data: 'clock_in',
                name: 'clock_in',
            },
            {
                data: 'clock_out',
                name: 'clock_out',
            },
            {
                data: 'location',
                name: 'location',
            },
            {
                data: 'img',
                name: 'img',
            },
          
           
        ],


        "order": [],
        'language': {
            'lengthMenu': '_MENU_ {{__("records per page")}}',
            "info": '{{trans("file.Showing")}} _START_ - _END_ (_TOTAL_)',
            "search": '{{trans("file.Search")}}',
            'paginate': {
                'previous': '{{trans("file.Previous")}}',
                'next': '{{trans("file.Next")}}'
            }
        },

        'columnDefs': [{

                "orderable": true,
                'targets': [0, 5],
            },
            {
                'render': function(data, type, row, meta) {
                    if (type == 'display') {
                        data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
                    }

                    return data;
                },
                'checkboxes': {
                    'selectRow': true,
                    'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>'
                },
                'targets': [0]
            }
        ],


        'select': {
            style: 'multi',
            selector: 'td:first-child'
        },
        'lengthMenu': [
            [10, 25, 50, -1],
            [10, 25, 50, "All"]
        ],
        dom: '<"row"lfB>rtip',
        buttons: [{
                extend: 'pdf',
                text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                footer: true
            },
            {
                extend: 'csv',
                text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                footer: true
            },
            {
                extend: 'print',
                text: '<i title="print" class="fa fa-print"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                footer: true
            },
            {
                extend: 'colvis',
                text: '<i title="column visibility" class="fa fa-eye"></i>',
                columns: ':gt(0)'
            },
        ],

    });
    new $.fn.dataTable.FixedHeader(table_table);
</script>
@endsection