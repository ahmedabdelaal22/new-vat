<div class="client_download" style="display: none;">
  <div class="m-portlet__body" style="padding-bottom: 0;">
    <div class="col-lg-12">
    <div class="client_upload_title">{{trans('main.download_examples')}}</div>
    <div class="d-flex">
          <a href="<?=url("uploads/$basicRoute/Sample.xls")?>"
              class="base_btn" download>
              <i class="fa fa-download"></i>
              <span>{{trans('main.download_XLS_sample')}}</span>
          </a>
          <a href="<?=url("uploads/$basicRoute/Sample.ods")?>" class="base_btn"
          download >
          <i class="fa fa-download"></i>
          <span>{{trans('main.download_ODS_sample')}}</span>
          </a>
    </div>
    <br>
    <div class="client_upload_title"> {{trans('main.upload_file')}}<span class="text-muted" style="direction: ltr;"> .xls, .xslx</span></div>
    <form method="post" enctype="multipart/form-data" action="{{ url("$basicRoute/import") }}">
        {{ csrf_field() }}
        <div class="form-group">
      <!--     <input type="file" name="select_file" />
          <input type="submit" name="upload" class="btn btn-primary" value="Upload">
   -->
          <div class="file-upload">
              <label for="upload" class="file-upload__label base_btn">
                <i class="fa fa-upload"></i>
                <span>{{trans('main.upload_file')}}</span>
              </label>
              <input id="upload" class="file-upload__input" type="file" name="select_file" value="Upload">
          </div>
        </div>


        

    </form>
    </div>
</div>
</div>

