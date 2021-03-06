{include file='header.tpl'}
<body>
{include file='sidebar.tpl'}

<div class="main-content">
    {include file='navbar.tpl'}

    <!-- Header -->
    <div class="header bg-gradient-primary pb-9 pt-5 pt-md-7">
        <div class="container-fluid">
            <div class="header-body">
                <h1 class="text-white">{$FORUMS}</h1>
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
                    <a href="{$NEW_FORUM_LINK}" class="btn btn-info">{$NEW_FORUM}</a>
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

                    {if count($FORUMS_ARRAY)}
                        <div class="table-responsive">
                            <table class="table">
                                <tbody id="sortable">
                                {foreach from=$FORUMS_ARRAY item=item name=forum_array}
                                    <tr data-id="{$item.id}">
                                        <td{if $item.parent_forum} style="padding-left:{math equation="x * y" x=25 y=$item.parent_forum_count}px"{/if}>
                                            <a href="{$item.edit_link}">{$item.title}</a>{if $item.parent_forum}
                                            <small>| {$item.parent_forum}</small>{/if}<br/>{$item.description}
                                        </td>
                                        <td>
                                            <div class="float-md-right">
                                                {if $item.up_link}
                                                    <a href="{$item.up_link}" class="btn btn-success btn-sm"><i
                                                                class="fas fa-chevron-up"></i></a>
                                                {/if}
                                                {if $item.down_link}
                                                    <a href="{$item.down_link}" class="btn btn-warning btn-sm"><i
                                                                class="fas fa-chevron-down"></i></a>
                                                {/if}
                                                <a href="{$item.delete_link}" class="btn btn-danger btn-sm"><i
                                                            class="fas fa-trash"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {else}
                        <p>{$NO_FORUMS}</p>
                    {/if}

                    <form action="" method="post">
                        <div class="form-group">
                            <label for="InputEnabled">{$USE_REACTIONS}</label>
                            <input type="checkbox" name="enabled" id="InputEnabled"
                                   class="js-switch"{if $USE_REACTIONS_VALUE} checked{/if} />
                        </div>
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="submit" class="btn btn-info" value="{$SUBMIT}"/>
                    </form>

                </div>
            </div>

            <!-- Spacing -->
            <div style="height:1rem;"></div>

        </div>
        {include file='footer.tpl'}
    </div>

    {include file='scripts.tpl'}

    <script type="text/javascript">
        $(document).ready(function () {
            $("#sortable").sortable({
                start: function (event, ui) {
                    let start_pos = ui.item.index();
                    ui.item.data('startPos', start_pos);
                },
                update: function (event, ui) {
                    let forums = $("#sortable").children();
                    let toSubmit = [];
                    forums.each(function () {
                        toSubmit.push($(this).data().id);
                    });

                    $.ajax({
                        url: "{$REORDER_DRAG_URL}",
                        type: "GET",
                        data: {
                            action: "order",
                            dir: "drag",
                            {literal}forums: JSON.stringify({"forums": toSubmit}){/literal}
                        },
                        success: function (response) {
                            // Success
                        },
                        error: function (xhr) {
                            // Error
                            console.log(xhr);
                        }
                    });
                }
            });
        });
    </script>

</body>
</html>