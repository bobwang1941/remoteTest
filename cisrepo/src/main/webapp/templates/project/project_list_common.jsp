	<%@ page pageEncoding="UTF-8"%>
	<a class="panel panel-primary project-container hidden" data-tpl="project">
		<p class="project-delete">
			<i class="fa fa-times"></i>
		</p>
		<div class="panel-heading">
			<h3 class="panel-title">
			</h3>
		</div>
		<div class="panel-body">
			<div class="project-maturity">
				成熟度： <i class="crp-badge badge-build"></i>
					<i class="crp-badge badge-sonar"></i>
					<i class="crp-badge badge-delivery"></i>
			</div>
			<div class="action-user"></div>
			<div class="action-time"></div>
		</div>
	</a>
	<div class="project-container hidden" data-tpl="loading-more">
		<a href="javascript:void(0);" class="thumbnail show-more">
			<div class="project-info">
				<p class="short-string">
					<span class="px-0-1">显示全部</span> <i class="fa fa-angle-double-right"></i>
				</p>
			</div>
		</a>
	</div>
	<!-- Delete Modal -->
	<div class="modal fade" id="deleteProjectModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog settings-delete-view" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">删除项目</h4>
				</div>
				<div class="modal-body">一旦你删除了项目，所有与项目有关的信息将会被永久删除。这是一个不可恢复的操作，请谨慎对待！</div>
				<div class="modal-footer">
					<p>
						<button type="button" class="btn btn-danger confirm-handler form-control" id="deleteProjectGroupYes">删除项目</button>
						<input class="delete-input form-control hidden" type="text" placeholder="请输入“DELETE”以确认">
					</p>
				</div>
			</div>
		</div>
	</div>
