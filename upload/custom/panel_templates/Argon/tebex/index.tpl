{include file='header.tpl'}
<body>
{include file='sidebar.tpl'}

<div class="main-content">
    {include file='navbar.tpl'}

    <!-- Header -->
    <div class="header bg-gradient-primary pb-9 pt-5 pt-md-7">
        <div class="container-fluid">
            <div class="header-body">
                <h1 class="text-white">{$BUYCRAFT}</h1>
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
                        <div class="form-group">
                            <label for="inputSecretKey">{$SERVER_KEY}</label>
                            <span class="badge badge-info" data-html="true" data-toggle="popover" title="{$INFO}"
                                  data-content="{$SERVER_KEY_INFO}"><i class="fas fa-question-circle"></i></span>
                            <input id="inputSecretKey" name="server_key" class="form-control"
                                   placeholder="{$SERVER_KEY}" value="{$SERVER_KEY_VALUE}">
                        </div>

                        <div class="form-group">
                            <label for="inputAllowGuests">{$ALLOW_GUESTS}</label>
                            <input type="checkbox" name="allow_guests" id="inputAllowGuests"
                                   class="js-switch" {if $ALLOW_GUESTS_VALUE} checked{/if} />
                        </div>

                        <div class="form-group">
                            <label for="inputStorePath">{$STORE_PATH}</label>
                            <input type="text" class="form-control" id="inputStorePath" name="store_path"
                                   placeholder="{$STORE_PATH}" value="{$STORE_PATH_VALUE}">
                        </div>

                        <div class="form-group">
                            <label for="inputStoreContent">{$STORE_INDEX_CONTENT}</label>
                            <textarea id="inputStoreContent"
                                      name="store_content">{$STORE_INDEX_CONTENT_VALUE}</textarea>
                        </div>

                        <div class="form-group">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <input type="submit" value="{$SUBMIT}" class="btn btn-primary">
                        </div>
                    </form>

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