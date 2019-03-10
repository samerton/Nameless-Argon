{include file='header.tpl'}
<body>
{include file='sidebar.tpl'}

<div class="main-content">
    {include file='navbar.tpl'}

    <!-- Header -->
    <div class="header bg-gradient-primary pb-9 pt-5 pt-md-7">
        <div class="container-fluid">
            <div class="header-body">
                <h1 class="text-white">{$EDITING_TEMPLATE}</h1>
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

                    {if isset($DEFAULT_TEMPLATE_WARNING)}
                        <div class="alert alert-warning">{$DEFAULT_TEMPLATE_WARNING}</div>
                    {/if}

                    <div class="table-responsive">
                        <table class="table table-striped">
                            {if count($TEMPLATE_DIRS)}
                                {foreach from=$TEMPLATE_DIRS item=dir}
                                    <tr>
                                        <td>
                                            <i class="fa fa-folder"></i> {$dir.name}
                                            <div class="float-right">
                                                <a href="{$dir.link}" class="btn btn-info btn-sm"><i
                                                            class="fas fa-search fa-fw"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                {/foreach}
                            {/if}
                            {if count($TEMPLATE_FILES)}
                                {foreach from=$TEMPLATE_FILES item=file}
                                    <tr>
                                        <td>
                                            <i class="fa fa-file"></i> {$file.name}
                                            <div class="float-right">
                                                <a href="{$file.link}" class="btn btn-info btn-sm"><i
                                                            class="fas fa-edit fa-fw"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                {/foreach}
                            {/if}
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