<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-bar-chart"></i> <?php echo $text_list; ?></h3>
                <div class="pull-right">
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_show_filter; ?>" class="btn btn-primary btn-sm" id="showFilter"><i class="fa fa-eye"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_hide_filter; ?>" class="btn btn-primary btn-sm" id="hideFilter"><i class="fa fa-eye-slash"></i></button>
                </div>
            </div>
            <div class="panel-body">
                <div class="well" style="display:none;">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="caret"></span>
                                    </button>
                                    <button type="button" onclick="filter();" class="btn btn-default"><div class="filter-type"><?php echo $entry_customer; ?></div></button>
                                    <ul class="dropdown-menu">
                                        <li><a class="filter-list-type" onclick="changeFilterType('<?php echo $entry_customer; ?>', 'filter_customer');"><?php echo $entry_customer; ?></a></li>
                                        <li><a class="filter-list-type" onclick="changeFilterType('<?php echo $entry_ip; ?>', 'filter_ip');"><?php echo $entry_ip; ?></a></li>
                                        <li><a class="filter-list-type" onclick="changeFilterType('<?php echo $entry_date_start; ?>', 'filter_date_start');"><?php echo $entry_date_start; ?></a></li>
                                        <li><a class="filter-list-type" onclick="changeFilterType('<?php echo $entry_date_end; ?>', 'filter_date_end');"><?php echo $entry_date_end; ?></a></li>
                                    </ul>
                                </div>
                                <input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" id="input-customer" class="form-control filter" />
                                <input type="text" name="filter_ip" value="<?php echo $filter_ip; ?>" id="input-ip" class="form-control filter hidden" />
                                <div class="input-group date filter hidden">
                                    <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start" class="form-control filter" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
                                <div class="input-group date filter hidden">
                                    <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control filter hidden" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <td class="text-left"><?php echo $column_comment; ?></td>
                            <td class="text-left"><?php echo $column_ip; ?></td>
                            <td class="text-left"><?php echo $column_date_added; ?></td>
                        </tr>
                        </thead>
                        <tbody>
                        <?php if ($activities) { ?>
                        <?php foreach ($activities as $activity) { ?>
                        <tr>
                            <td class="text-left"><?php echo $activity['comment']; ?></td>
                            <td class="text-left"><?php echo $activity['ip']; ?></td>
                            <td class="text-left"><?php echo $activity['date_added']; ?></td>
                        </tr>
                        <?php } ?>
                        <?php } else { ?>
                        <tr>
                            <td class="text-center" colspan="3"><?php echo $text_no_results; ?></td>
                        </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript"><!--
    function filter() {
        url = 'index.php?route=report/customer_activity&token=<?php echo $token; ?>';

        var filter_customer = $('input[name=\'filter_customer\']').val();

        if (filter_customer) {
            url += '&filter_customer=' + encodeURIComponent(filter_customer);
        }
        var filter_ip = $('input[name=\'filter_ip\']').val();

        if (filter_ip) {
            url += '&filter_ip=' + encodeURIComponent(filter_ip);
        }

        var filter_date_start = $('input[name=\'filter_date_start\']').val();

        if (filter_date_start) {
            url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
        }

        var filter_date_end = $('input[name=\'filter_date_end\']').val();

        if (filter_date_end) {
            url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
        }

        location = url;
    }

    function changeFilterType(text, filter_type) {
        $('.filter-type').text(text);

        $('.filter').addClass('hidden');
        $('input[name=\'' + filter_type + '\']').removeClass('hidden');
        $('select[name=\'' + filter_type + '\']').removeClass('hidden');
        if (filter_type == 'filter_date_start' || filter_type == 'filter_date_end') {
            $('.well .input-group-btn').removeClass('hidden');
            $('.well .input-group').removeClass('hidden');
        }
    }
    //--></script>
    <script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });
    //--></script></div>
<?php echo $footer; ?>