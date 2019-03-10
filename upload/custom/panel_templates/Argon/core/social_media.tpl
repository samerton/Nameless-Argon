{include file='header.tpl'}
<body>
{include file='sidebar.tpl'}

<div class="main-content">
    {include file='navbar.tpl'}

    <!-- Header -->
    <div class="header bg-gradient-primary pb-9 pt-5 pt-md-7">
        <div class="container-fluid">
            <div class="header-body">
                <h1 class="text-white">{$SOCIAL_MEDIA}</h1>
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
                            <label for="InputYoutube">{$YOUTUBE_URL}</label>
                            <input type="text" name="youtubeurl" class="form-control" id="InputYoutube"
                                   placeholder="{$YOUTUBE_URL}"
                                   value="{$YOUTUBE_URL_VALUE}">
                        </div>
                        <div class="form-group">
                            <label for="InputFacebook">{$FACEBOOK_URL}</label>
                            <input type="text" name="fburl" class="form-control" id="InputFacebook"
                                   placeholder="{$FACEBOOK_URL}"
                                   value="{$FACEBOOK_URL_VALUE}">
                        </div>
                        <div class="form-group">
                            <label for="InputTwitter">{$TWITTER_URL}</label>
                            <input type="text" name="twitterurl" class="form-control" id="InputTwitter"
                                   placeholder="{$TWITTER_URL}"
                                   value="{$TWITTER_URL_VALUE}">
                        </div>
                        <div class="form-group">
                            <label for="InputTwitterStyle">{$TWITTER_STYLE}</label>
                            <input id="InputTwitterStyle" name="twitter_dark_theme" type="checkbox"
                                   class="js-switch"
                                   value="1"{if $TWITTER_STYLE_VALUE eq 'dark'} checked{/if} />
                        </div>
                        <div class="form-group">
                            <label for="InputDiscord">{$DISCORD_SERVER_ID}</label>
                            <input type="text" name="discordid" class="form-control" id="InputDiscord"
                                   placeholder="{$DISCORD_SERVER_ID}"
                                   value="{$DISCORD_SERVER_ID_VALUE}">
                        </div>
                        <h4>{$DISCORD_HOOKS}</h4>
                        <div class="alert alert-info">
                            <h5 class="h3 mb-0" style="color: white;"><i class="icon fa fa-info-circle"></i> {$INFO}
                            </h5>
                            {$DISCORD_HOOKS_INFO}
                        </div>
                        <div class="form-group">
                            <label for="InputDiscordHookURL">{$DISCORD_HOOK_URL}</label>
                            <input type="text" class="form-control" name="discord_url"
                                   placeholder="{$DISCORD_HOOK_URL}"
                                   value="{$DISCORD_HOOK_URL_VALUE}"
                                   id="InputDiscordHookURL">
                        </div>
                        <div class="form-group">
                            <label for="InputDiscordHooks">{$DISCORD_HOOK_EVENTS}</label>
                            <select multiple class="form-control" name="discord_hooks[]"
                                    id="InputDiscordHooks">
                                {foreach from=$DISCORD_ALL_HOOKS key=key item=item}
                                    <option value="{$key|escape}"{if in_array($key|escape, $DISCORD_ENABLED_HOOKS)} selected{/if}>{$item|escape}</option>
                                {/foreach}
                            </select>
                        </div>
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="submit" class="btn btn-info"
                               value="{$SUBMIT}">
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