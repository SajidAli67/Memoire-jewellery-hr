<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\company;
use App\Models\DocumentWorkflow;
use App\Models\designation;
use Illuminate\Support\Arr;

class DocumentWorkFlowController extends Controller
{
    //

    public function approval_workflow(){
        $logged_user = auth()->user();
        $workflows = DocumentWorkflow::join('companies as c','c.id', '=', 'document_workflows.company_id')
        ->join('designations as d2','d2.id','=','document_workflows.approver_2nd')
        ->join('designations as d3','d3.id','=','document_workflows.approver_3rd')
        ->join('designations as d4','d4.id','=','document_workflows.approver_4th')
        ->select(
            'document_workflows.id',
            'approver_1st',
            'd2.designation_name as approver_2nd',
            'd3.designation_name as approver_3rd',
            'd4.designation_name as approver_4th',
            'c.company_name as company_name'
        )
        ->where('type','leave')->get();

          
        $companies = company::select('id', 'company_name')->get();
        return view('document_workflow.approval_workflow', compact('workflows','companies'));
    }

    public function edit($id){
        $workflows = DocumentWorkflow::where('id',$id)->first();
        $designation = designation::where('company_id',$workflows->company_id)
        ->select('id','designation_name')
        ->get();
        return json_encode(array('data'=>$workflows,'designation'=>$designation));
        
    }

    public function update(Request $request){
        $workflow = DocumentWorkflow::find($request->work_flow_id);
        $workflow->code = $request->code;
        $workflow->type = 'leave';
        $workflow->description = $request->description;
        $workflow->company_id = $request->company_id;
        $workflow->approver_1st = $request->approver_1st;
        $workflow->approver_2nd = $request->approver_2nd;
        $workflow->approver_3rd = $request->approver_3rd;
        $workflow->approver_4th = $request->approver_4th;
        $workflow->save();
        
        $this->setSuccessMessage(__('Update Successfully'));
        return back();
    }


    public function destroy($id){
       
        DocumentWorkflow::whereId($id)->delete();
        return response()->json(['success' => __('Data is successfully deleted')]);
    }

    public function leave_workflow(Request $request){

        $workflow = new DocumentWorkflow;
        $workflow->code = $request->code;
        $workflow->type = 'leave';
        $workflow->description = $request->description;
        $workflow->company_id = $request->company_id;
        $workflow->approver_1st = $request->approver_1st;
        $workflow->approver_2nd = $request->approver_2nd;
        $workflow->approver_3rd = $request->approver_3rd;
        $workflow->approver_4th = $request->approver_4th;
        $workflow->save();

        $this->setSuccessMessage(__('Adding Successfully'));
        return back();
    }
}
