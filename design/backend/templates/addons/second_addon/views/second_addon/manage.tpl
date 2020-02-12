{capture name="mainbox"}
    {if $orders}
        <div class="table-responsive-wrapper">
            <table width="100%" class="table table-middle table-responsive">
                <thead>
                <tr>
                    <th width="17%"><a class="cm-ajax" href="{"`$c_url`&sort_by=order_id&sort_order=`$search.sort_order_rev`"|fn_url}" data-ca-target-id={$rev}>{__("id")}{if $search.sort_by == "order_id"}{$c_icon nofilter}{else}{$c_dummy nofilter}{/if}</a></th>
                    <th width="17%">{__("old_status")}</th>
                    <th width="17%">{__("updated_status")}</th>
                    <th width="15%"><a class="cm-ajax" href="{"`$c_url`&sort_by=date&sort_order=`$search.sort_order_rev`"|fn_url}" data-ca-target-id={$rev}>{__("date")}{if $search.sort_by == "date"}{$c_icon nofilter}{else}{$c_dummy nofilter}{/if}</a></th>
                    <th width="20%"><a class="cm-ajax" href="{"`$c_url`&sort_by=customer&sort_order=`$search.sort_order_rev`"|fn_url}" data-ca-target-id={$rev}>{__("user")}{if $search.sort_by == "customer"}{$c_icon nofilter}{/if}</a></th>

                </tr>
                </thead>
                {foreach from=$orders item="o"}
                    <tr>

                        <td data-th="{__("id")}">
                            <a href="{"orders.details?order_id=`$o.order_id`"|fn_url}" class="underlined">{__("order")} <bdi>#{$o.order_id}</bdi></a>
                            {if $order_statuses[$o.status].params.appearance_type == "I" && $o.invoice_id}
                                <p class="muted">{__("invoice")} #{$o.invoice_id}</p>
                            {elseif $order_statuses[$o.status].params.appearance_type == "C" && $o.credit_memo_id}
                                <p class="muted">{__("credit_memo")} #{$o.credit_memo_id}</p>
                            {/if}
                            {include file="views/companies/components/company_name.tpl" object=$o}
                        </td>
                        <td class="nowrap" data-th="{__("old_status")}">{$o.old_status}</td>
                        <td class="nowrap" data-th="{__("updated_status")}">{$o.new_status}</td>
                        <td class="nowrap" data-th="{__("date")}">{$o.timestamp|date_format:"`$settings.Appearance.date_format`, `$settings.Appearance.time_format`"}</td>
                        <td data-th="{__("user")}">
                            {if $o.user_id}<a href="{"profiles.update?user_id=`$o.user_id`"|fn_url}">{/if}{$o.username}{if $o.user_id}</a>
                            {/if}
                        </td>
                    </tr>
                {/foreach}
            </table>
        </div>
    {else}

    {/if}
    {if $orders}
    {/if}
    {include file="common/pagination.tpl" div_id=$smarty.request.content_id}
    </form>
{/capture}
{include file="common/mainbox.tpl" title=$page_title  content=$smarty.capture.mainbox buttons=$smarty.capture.buttons  content_id="manage_second_addon"}
