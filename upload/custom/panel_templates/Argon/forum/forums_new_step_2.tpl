{include file='header.tpl'}
<body>
{include file='sidebar.tpl'}

<div class="main-content">
    {include file='navbar.tpl'}

    <!-- Header -->
    <div class="header bg-gradient-primary pb-9 pt-5 pt-md-7">
        <div class="container-fluid">
            <div class="header-body">
                <h1 class="text-white">{$CREATING_FORUM}</h1>
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
                    <button class="btn btn-warning" onclick="showCancelModal()">{$CANCEL}</button>
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
                        <div class="form-group">
                            <label for="InputParent">{$SELECT_PARENT_FORUM}</label>
                            <select class="form-control" id="InputParent" name="parent">
                                {foreach from=$PARENT_FORUMS item=item}
                                    <option value="{$item.id}">{$item.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="InputNews">{$DISPLAY_TOPICS_AS_NEWS}</label>
                            <input type="hidden" name="news_forum" value="0">
                            <input name="news_forum" id="InputNews" type="checkbox" class="js-switch" value="1"/>
                        </div>
                        <div class="form-group">
                            <label for="InputForumRedirect">{$REDIRECT_FORUM}</label>
                            <input type="hidden" name="redirect" value="0">
                            <input name="redirect" id="InputForumRedirect" type="checkbox" class="js-switch" value="1"/>
                        </div>
                        <div class="form-group">
                            <label for="InputForumRedirectURL">{$REDIRECT_URL}</label>
                            <input placeholder="{$REDIRECT_URL}" name="redirect_url" id="InputForumRedirectURL"
                                   type="text" class="form-control" value="{$REDIRECT_URL_VALUE}"/>
                        </div>
                        <div class="form-group">
                            <label for="InputForumWebhook">{$INCLUDE_IN_HOOK}</label>
                            <input type="hidden" name="webhook" value="0">
                            <input name="webhook" id="InputForumWebhook" type="checkbox" class="js-switch" value="1"/>
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

    <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{$ARE_YOU_SURE}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$CONFIRM_CANCEL}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <a href="{$CANCEL_LINK}" class="btn btn-info">{$YES}</a>
                </div>
            </div>
        </div>
    </div>

    {include file='scripts.tpl'}

    <script type="text/javascript">
        function showCancelModal() {
            $('#cancelModal').modal().show();
        }
    </script>

</body>
</html>