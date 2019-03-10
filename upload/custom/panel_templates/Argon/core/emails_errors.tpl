{include file='header.tpl'}
<body>
{include file='sidebar.tpl'}

<div class="main-content">
    {include file='navbar.tpl'}

    <!-- Header -->
    <div class="header bg-gradient-primary pb-9 pt-5 pt-md-7">
        <div class="container-fluid">
            <div class="header-body">
                <h1 class="text-white">{$EMAIL_ERRORS}</h1>
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
                <br />
                <a href="{$UPDATE_LINK}" class="btn btn-primary" style="text-decoration:none">{$UPDATE}</a>
                <hr />
                {$CURRENT_VERSION}<br/>
                {$NEW_VERSION}
            </div>
            {/if}

            <div class="card">
                <div class="card-body">
                    <a class="btn btn-info" href="{$BACK_LINK}">{$BACK}</a>
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

                    {if isset($NO_ERRORS)}
                        {$NO_ERRORS}
                    {else}
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>{$TYPE}</th>
                                    <th>{$DATE}</th>
                                    <th>{$USERNAME}</th>
                                    <th>{$ACTIONS}</th>
                                </tr>
                                </thead>
                                <tbody>
                                {foreach from=$EMAIL_ERRORS_ARRAY item=item}
                                    <tr>
                                        <td>{$item.type}</td>
                                        <td>{$item.date}</td>
                                        <td>{$item.user}</td>
                                        <td>
                                            <a href="{$item.view_link}" class="btn btn-info btn-sm"><i
                                                        class="fa fa-fw fa-search"></i></a>
                                            <a href="#" onclick="showDeleteModal({$item.id})"
                                               class="btn btn-danger btn-sm"><i class="fa fa-fw fa-trash"></i></a>
                                        </td>
                                    </tr>
                                {/foreach}
                                </tbody>
                            </table>
                        </div>
                        <br />
                        {$PAGINATION}
                    {/if}

                </div>
            </div>

            <!-- Spacing -->
            <div style="height:1rem;"></div>

        </div>

        {include file='footer.tpl'}
    </div>

    <!-- Delete error modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{$ARE_YOU_SURE}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$CONFIRM_DELETE_ERROR}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <a href="" id="deleteLink" class="btn btn-info">{$YES}</a>
                </div>
            </div>
        </div>
    </div>

    {include file='scripts.tpl'}

    <script type="text/javascript">
        function showDeleteModal(id) {
            $('#deleteLink').attr('href', '{$DELETE_LINK}'.replace('{literal}{x}{/literal}', id));
            $('#deleteModal').modal().show();
        }
    </script>

</body>
</html>