{include file='header.tpl'}
<body>
{include file='sidebar.tpl'}

<div class="main-content">
    {include file='navbar.tpl'}

    <!-- Header -->
    <div class="header bg-gradient-primary pb-9 pt-5 pt-md-7">
        <div class="container-fluid">
            <div class="header-body">
                <h1 class="text-white">{$EDITING_WIDGET}</h1>
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
                    {if isset($SETTINGS)}<a href="{$SETTINGS_LINK}" class="btn btn-info">{$SETTINGS}</a>{/if}
                    <a href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a>
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

                    <form action="" method="post">
                        {foreach from=$POSSIBLE_PAGES key=module item=module_pages}
                            {if count($module_pages)}
                                <div class="table table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>{$MODULE} {$MODULE_SEPERATOR} {$module|escape}</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        {foreach from=$module_pages key=page item=value}
                                            <tr>
                                                <td>
                                                    <label for="{$page|escape}" style="font-weight: normal;">{($page|escape)|ucfirst}</label>
                                                    <div class="float-md-right">
                                                        <input class="js-switch" type="checkbox" name="pages[]"
                                                               id="{$page|escape}"
                                                               value="{$page|escape}"{if in_array($page, $ACTIVE_PAGES)} checked{/if} >
                                                    </div>
                                                </td>
                                            </tr>
                                        {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                                <br />
                            {/if}
                        {/foreach}

                        <br/>

                        <div class="form-group">
                            <label for="inputOrder">{$WIDGET_ORDER}</label>
                            <input id="inputOrder" name="order" type="number" class="form-control" value="{$ORDER}">
                        </div>

                        <div class="form-group">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <input type="submit" class="btn btn-info" value="{$SUBMIT}">
                        </div>
                    </form>

                </div>
            </div>

            <!-- Spacing -->
            <div style="height:1rem;"></div>

        </div>

        {include file='footer.tpl'}
    </div>

    {include file='scripts.tpl'}

</body>
</html>