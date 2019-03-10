{include file='header.tpl'}
<body>
{include file='sidebar.tpl'}

<div class="main-content">
    {include file='navbar.tpl'}

    <!-- Header -->
    <div class="header bg-gradient-primary pb-9 pt-5 pt-md-7">
        <div class="container-fluid">
            <div class="header-body">
                <h1 class="text-white">{$NEW_SITE}</h1>
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
                    <a href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a>
                    <hr/>

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
                            <label for="InputVoteName">{$VOTE_SITE_NAME}</label>
                            <input type="text" id="InputVoteName" placeholder="{$VOTE_SITE_NAME}" name="vote_site_name"
                                   class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="InputVoteURL">{$VOTE_SITE_URL}</label>
                            <input type="text" id="InputVoteURL" placeholder="{$VOTE_SITE_URL}" name="vote_site_url"
                                   class="form-control" value="http://">
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <input type="submit" class="btn btn-info" value="{$SUBMIT}">
                        </div>
                    </form>
                </div>
            </div>

        </div>
        {include file='footer.tpl'}
    </div>

    {include file='scripts.tpl'}

</body>
</html>