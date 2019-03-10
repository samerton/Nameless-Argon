{include file='header.tpl'}
<body>
{include file='sidebar.tpl'}

<div class="main-content">
    {include file='navbar.tpl'}

    <!-- Header -->
    <div class="header bg-gradient-primary pb-9 pt-5 pt-md-7">
        <div class="container-fluid">
            <div class="header-body">
                <h1 class="text-white">{$ERROR_LOGS}</h1>
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

                    <a href="{$BACK_LINK}" class="btn btn-info">{$BACK}</a>

                    <br /><br />

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

                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tr>
                                <td>
                                    <a href="{$FATAL_LOG_LINK}">{$FATAL_LOG}</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="{$NOTICE_LOG_LINK}">{$NOTICE_LOG}</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="{$WARNING_LOG_LINK}">{$WARNING_LOG}</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="{$OTHER_LOG_LINK}">{$OTHER_LOG}</a>
                                </td>
                            </tr>
                        </table>
                    </div>

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