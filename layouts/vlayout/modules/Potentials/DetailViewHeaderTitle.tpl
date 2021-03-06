{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
* Contributor(s): YetiForce.com
********************************************************************************/
-->*}
{strip}
	{assign var=IMAGE value=$MODULE_NAME|cat:'48.png'}
	{if file_exists( vimage_path($IMAGE) )}
		<span class="pull-left spanModuleIcon moduleIcon{$MODULE_NAME}">
			<span class="moduleIcon">
				<img src="{vimage_path($IMAGE)}" class="summaryImg pushDown" alt="{vtranslate($MODULE, $MODULE)}"/>
			</span>
		</span>
	{/if}
    <div class="col-xs-10 col-sm-9 col-md-8 margin0px">
        <div>
            <h4 class="recordLabel pushDown marginbottomZero" title="{$RECORD->getName()}">
                {foreach item=NAME_FIELD from=$MODULE_MODEL->getNameFields()}
                    {assign var=FIELD_MODEL value=$MODULE_MODEL->getField($NAME_FIELD)}
                    {if $FIELD_MODEL->getPermissions()}
                        <span class="moduleColor_{$MODULE_NAME} {$NAME_FIELD}">{$RECORD->get($NAME_FIELD)}</span>&nbsp;
                    {/if}
                {/foreach}
            </h4>
        </div>
        {assign var=RELATED_TO value=$RECORD->get('related_to')}
        {if !empty($RELATED_TO)}
            <div class="paddingLeft5px">
				<span class="muted"></span>
				{assign var=RELATEDTO_RECORD_MODEL value=Vtiger_Record_Model::getInstanceById($RELATED_TO)}
				<h5 class="margin0px"><span class="">{$RECORD->getDisplayValue('related_to')}</span>&nbsp;[{strip_tags($RELATEDTO_RECORD_MODEL->getDisplayValue('assigned_user_id'))}]</h5>
            </div>
        {/if}
		<div class="paddingLeft5px">
			<span class="muted">
				{vtranslate('Assigned To',$MODULE_NAME)}: {$RECORD->getDisplayValue('assigned_user_id')}
				{if $RECORD->get('shownerid') != ''}
				<br/>{vtranslate('Share with users',$MODULE_NAME)} {$RECORD->getDisplayValue('shownerid')}
				{/if}			
			</span>
		</div>
		{if $RECORD->get('sales_stage') != ''}
            <div class="paddingLeft5px">
				<span class="muted">{vtranslate('Sales Stage',$MODULE_NAME)} </span>
				<span class="wrapper">{$RECORD->getDisplayValue('sales_stage')}</span>
            </div>
		{/if}
    </div>
{/strip}
