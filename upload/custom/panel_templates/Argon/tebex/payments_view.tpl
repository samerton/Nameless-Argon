{include file='header.tpl'}
<body>
{include file='sidebar.tpl'}

<div class="main-content">
    {include file='navbar.tpl'}

    <!-- Header -->
    <div class="header bg-gradient-primary pb-9 pt-5 pt-md-7">
        <div class="container-fluid">
            <div class="header-body">
                <h1 class="text-white">{$VIEWING_PAYMENT}</h1>
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
                    <a class="btn btn-warning" href="{$BACK_LINK}">{$BACK}</a>
                    <hr/>

                    {if isset($SUCCESS)}
                        <div class="alert alert-success alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h5 class="h3 mb-0" style="color: white;"><i class="icon fa fa-check"></i> {$SUCCESS_TITLE}
                            </h5>
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

                    <div class="table-responsive">
                        <table class="table table-striped">
                            <colgroup>
                                <col span="1" style="width: 50%">
                                <col span="1" style="width: 50%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td><strong>{$IGN}</strong></td>
                                <td><img src="{$AVATAR}" class="rounded" style="max-height:32px;max-width:32px;"
                                         alt="{$IGN_VALUE}"> <a style="{$STYLE}" href="{$USER_LINK}">{$IGN_VALUE}</a>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>{$UUID}</strong></td>
                                <td>{$UUID_VALUE}</td>
                            </tr>
                            <tr>
                                <td><strong>{$PRICE}</strong></td>
                                <td>{$CURRENCY_SYMBOL}{$PRICE_VALUE} ({$CURRENCY_ISO})</td>
                            </tr>
                            <tr>
                                <td><strong>{$DATE}</strong></td>
                                <td>{$DATE_VALUE}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

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