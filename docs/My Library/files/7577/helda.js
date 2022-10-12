jQuery(document).ready(function() {


        // add onchange handler for search scope
        jQuery('.search-context').on('change', function() {
                var newAction = jQuery(this).val();
                console.log(newAction);
                jQuery('#main-search-form').attr('action', newAction);

        });

	
	// add classes to buttons
	jQuery('input[type="submit"]').each(function(index, e) {		
		var that = jQuery(this);
		that.addClass('btn');
		that.addClass('btn-default');
		that.removeClass('ds-button-field');
		if(that.parent().hasClass('current')) {
			that.addClass('btn-custom');
			
		}
	});
	
	// add classes to tables
	jQuery('table').addClass('table table-bordered');
	
	jQuery('.dropdown-toggle').dropdown()
	
	// submission - license step
    jQuery("#aspect_xmlworkflow_WorkflowTransformer_list_publish-or-not input").click(function () {
		var val = jQuery(this).val();
		if("true" == val) {
			jQuery('#aspect_xmlworkflow_WorkflowTransformer_div_license-content').show();
			
		}
		else {
			jQuery('#aspect_xmlworkflow_WorkflowTransformer_div_license-content').hide();
		}
		
    });
	
	// if javascript is enabled, show toggle abstract icons
	jQuery('.toggle-abstract-link').show();
    jQuery('.toggle-abstract-link').click(function(e) {
            e.preventDefault();
            var el = $(this);
            var parent = el.parent().parent();
            $('.artifact-abstract', parent).toggle('medium');

    });	
	
	// highlight dropdown option headers
	jQuery("form.submission option[value = 'group']").addClass('option-header');

	// add date pickers
	jQuery('.datepicker').datepicker({dateFormat: "dd.mm.yy"});
	
	// add handler for workflow action button
	jQuery('#org_hu_ethesis_workflow_Workflows_field_submit_generate_waiting_for_acceptance_list').click(function() {
		var url = jQuery('#org_hu_ethesis_workflow_Workflows_field_workflow_action_target').val();		
		window.location = url;
	});
	
	
	// add "Are you sure" listeners for workflow actions
	jQuery('#org_uh_dspace_ethesistheme_admin_EditWorkflowItem_field_submit_restart').click(function() {
		return confirm("Are you sure you want to restart the workflow?");
	});
	jQuery('#org_uh_dspace_ethesistheme_admin_EditWorkflowItem_field_submit_delete').click(function() {
		return confirm("Are you sure you want to delete the workflow? All data will be lost.");
	});	
	
	// add target=_blank to selected links
	jQuery('a.blank').attr('target', '_blank');
	
	// evaluation approval confirmation
	jQuery('#aspect_xmlworkflow_WorkflowTransformer_field_submit_approve').click(function() {		
		return approveEvaluation();  // from page-structure.xsl (localized message)
	})

    if(jQuery('#downloadstats').length) {
        var url = ""+window.location;        
        jQuery.getJSON(
                'https://helda.helsinki.fi/simplestats/helda.php?'+url+'&jsoncallback=?')
        .done(function(data) {
                jQuery('#downloadstats span').html(data.sum);
        })
        .fail(function() {
                jQuery('#downloadstats').html('Failure while getting download stats')
        });

    }
	
	
});

function toggle_abstract(element) {
    var e = $(element);
    var parent = e.parent().parent();
	
	$('.artifact-abstract', parent).toggle('medium');
}

function toggle_element_by_id(elementID) {

	var e = $('#' + elementID);
	if(e != null)
		e.toggle('medium');
}
