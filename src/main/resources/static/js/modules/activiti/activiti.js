$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sys/activiti/list',
        datatype: "json",
        colModel: [			
			{ label: '任务ID', name: 'taskId', index: "task_id", width: 45, key: true },
			{ label: '任务名称', name: 'taskName', index: "task_name", width: 75 },
            { label: '任务的办理人', name: 'taskAssignee', width: 75 },
			{ label: '创建时间', name: 'createTime',  index: "create_time", width: 100 },
			{ label: '流程实例ID', name: 'processInstanceId', width: 75 },
			{ label: '执行对象ID', name: 'executionId', width: 75 },
			{ label: '流程定义ID', name: 'processDefinitionId', width: 75}
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			taskAssignee: null
		},
		showList: true,
		title: null,
		activitiTask: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                postData:{'taskAssignee': vm.q.taskAssignee},
                page:page 
            }).trigger("reloadGrid");
		}
	}
});