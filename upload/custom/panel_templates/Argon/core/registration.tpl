{include file='header.tpl'}
<body>
{include file='sidebar.tpl'}

<div class="main-content">
    {include file='navbar.tpl'}

    <!-- Header -->
    <div class="header bg-gradient-primary pb-9 pt-5 pt-md-7">
        <div class="container-fluid">
            <div class="header-body">
                <h1 class="text-white">{$REGISTRATION}</h1>
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

                    <form id="enableRegistration" action="" method="post">
                        <div class="form-group">
                            {$ENABLE_REGISTRATION}
                            <input type="hidden" name="enable_registration" value="0">
                            <input name="enable_registration" type="checkbox"
                                   class="js-switch js-check-change"{if $REGISTRATION_ENABLED eq 1} checked{/if}
                                   value="1"/>
                        </div>
                        <input type="hidden" name="token" value="{$TOKEN}">
                    </form>

                    {if $REGISTRATION_ENABLED eq 1}
                        <form action="" method="post">
                            <div class="form-group">
                                <label for="verification">{$EMAIL_VERIFICATION}</label>
                                <input name="verification" id="verification" type="checkbox"
                                       class="js-switch"{if $EMAIL_VERIFICATION_VALUE eq 1} checked{/if} />
                            </div>
                            <div class="form-group">
                                <label for="InputEnableRecaptcha">{$GOOGLE_RECAPTCHA}</label>
                                <input id="InputEnableRecaptcha" name="enable_recaptcha" type="checkbox"
                                       class="js-switch" value="1"{if $GOOGLE_RECAPTCHA_VALUE eq 'true'} checked{/if} />
                            </div>
                            <div class="form-group">
                                <label for="InputEnableRecaptchaLogin">{$GOOGLE_RECAPTCHA_LOGIN}</label>
                                <input id="InputEnableRecaptchaLogin" name="enable_recaptcha_login" type="checkbox" class="js-switch" value="1"{if $GOOGLE_RECAPTCHA_LOGIN_VALUE eq 'true'} checked{/if} />
                            </div>
                            <div class="form-group">
                                <label for="InputRecaptcha">{$RECAPTCHA_SITE_KEY}</label>
                                <input type="text" name="recaptcha" class="form-control" id="InputRecaptcha"
                                       placeholder="{$RECAPTCHA_SITE_KEY}" value="{$RECAPTCHA_SITE_KEY_VALUE}">
                            </div>
                            <div class="form-group">
                                <label for="InputRecaptchaSecret">{$RECAPTCHA_SECRET_KEY}</label>
                                <input type="text" name="recaptcha_secret" class="form-control"
                                       id="InputRecaptchaSecret" placeholder="{$RECAPTCHA_SECRET_KEY}"
                                       value="{$RECAPTCHA_SECRET_KEY_VALUE}">
                            </div>
                            <div class="form-group">
                                <label for="InputRegistrationDisabledMessage">{$REGISTRATION_DISABLED_MESSAGE}</label>
                                <textarea style="width:100%" rows="10" name="message"
                                          id="InputRegistrationDisabledMessage">{$REGISTRATION_DISABLED_MESSAGE_VALUE}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="InputValidationPromoteGroup">{$VALIDATE_PROMOTE_GROUP}</label> <span
                                        class="badge badge-info" data-toggle="popover" data-title="{$INFO}"
                                        data-content="{$VALIDATE_PROMOTE_GROUP_INFO}"><i
                                            class="fa fa-question"></i></span>
                                <select class="form-control" id="InputValidationPromoteGroup" name="promote_group">
                                    {foreach from=$GROUPS item=group}
                                        <option value="{$group->id}"{if $group->id eq $VALIDATION_GROUP} selected{/if}>{$group->name|escape}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <input type="submit" class="btn btn-info" value="{$SUBMIT}">
                            </div>
                        </form>
                    {/if}

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