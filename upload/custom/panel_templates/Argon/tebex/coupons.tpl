{include file='header.tpl'}
<body>
{include file='sidebar.tpl'}

<div class="main-content">
    {include file='navbar.tpl'}

    <!-- Header -->
    <div class="header bg-gradient-primary pb-9 pt-5 pt-md-7">
        <div class="container-fluid">
            <div class="header-body">
                <h1 class="text-white">{$COUPONS}</h1>
            </div>
        </div>
    </div>

    <div class="container-fluid mt--8">

        {if isset($NEW_UPDATE)}
        {if $NEW_UPDATE_URGENT eq true}
        <div class="alert alert-danger">
            {else}
            <div class="alert alert-primary alert-dismissible" id="updateAlert">
                <button type="button" class="close" id="closeUpdate" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                {/if}
                {$NEW_UPDATE}
                <br/>
                <a href="{$UPDATE_LINK}" class="btn btn-primary" style="text-decoration:none">{$UPDATE}</a>
                <hr/>
                {$CURRENT_VERSION}<br/>
                {$NEW_VERSION}
            </div>
            {/if}

            <div class="card">
                <div class="card-body">
                    {if isset($NEW_COUPON)}
                        <a href="{$NEW_COUPON_LINK}" class="btn btn-primary">{$NEW_COUPON}</a>
                        <hr/>
                    {/if}

                    {if isset($SUCCESS)}
                        <div class="alert alert-success alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h5 class="h3 mb-0" style="color: white;"><i class="icon fa fa-check"></i> {$SUCCESS_TITLE}</h5>
                            {$SUCCESS}
                        </div>
                    {/if}

                    {if isset($ERRORS) && count($ERRORS)}
                        <div class="alert alert-danger alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h5 class="h3 mb-0" style="color: white;"><i
                                        class="icon fas fa-exclamation-triangle"></i> {$ERRORS_TITLE}</h5>
                            <ul>
                                {foreach from=$ERRORS item=error}
                                    <li>{$error}</li>
                                {/foreach}
                            </ul>
                        </div>
                    {/if}

                    {if isset($NO_COUPONS)}
                        <p>{$NO_COUPONS}</p>
                    {else}
                        <div class="table-responsive">
                            <table class="table table-bordered dataTables-coupons">
                                <colgroup>
                                    <col span="1" style="width: 35%;">
                                    <col span="1" style="width: 30%;">
                                    <col span="1" style="width: 20%">
                                    <col span="1" style="width: 15%">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>{$COUPON_CODE}</th>
                                    <th>{$EXPIRY_DATE_TABLE}</th>
                                    <th>{$USES}</th>
                                    <th>{$VIEW}</th>
                                </tr>
                                </thead>
                                <tbody>
                                {foreach from=$COUPON_LIST item=coupon}
                                    <tr>
                                        <td>{$coupon.code}</td>
                                        <td>{$coupon.expiry}</td>
                                        <td>{$coupon.limit}</td>
                                        <td>
                                            <a href="{$coupon.link}" class="btn btn-primary">{$VIEW}</a>
                                        </td>
                                    </tr>
                                {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {/if}

                </div>
            </div>

            <!-- Spacing -->
            <div style="height:1rem;"></div>

        </div>

        {include file='footer.tpl'}

    </div>
    <!-- ./wrapper -->

    {include file='scripts.tpl'}

</body>
</html>