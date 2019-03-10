{include file='header.tpl'}
<body>
{include file='sidebar.tpl'}

<div class="main-content">
    {include file='navbar.tpl'}

    <!-- Header -->
    <div class="header bg-gradient-primary pb-9 pt-5 pt-md-7">
        <div class="container-fluid">
            <div class="header-body">
                <h1 class="text-white">{$LOG_NAME}</h1>
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
                    <hr/>

                    {if isset($LOG)}
                        <pre class="error_log">
                                {$LOG}
                            </pre>
                        <hr/>
                        <h5>{$ACTIONS}</h5>
                        <a class="btn btn-warning" onclick="showPurgeModal()">{$PURGE_LOG}</a>
                    {else}
                        {$NO_LOG_FOUND}
                    {/if}

                </div>
            </div>

            <!-- Spacing -->
            <div style="height:1rem;"></div>

        </div>

        {include file='footer.tpl'}

    </div>
</div>

<div class="modal fade" id="purgeModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{$ARE_YOU_SURE}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                {$CONFIRM_PURGE_ERRORS}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                <a href="{$PURGE_LOG_LINK}" class="btn btn-info">{$YES}</a>
            </div>
        </div>
    </div>
</div>

{include file='scripts.tpl'}

<script type="text/javascript">
    function showPurgeModal() {
        $('#purgeModal').modal().show();
    }
</script>

</body>
</html>