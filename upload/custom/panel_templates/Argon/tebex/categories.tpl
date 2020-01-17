{include file='header.tpl'}
<body>
{include file='sidebar.tpl'}

<div class="main-content">
    {include file='navbar.tpl'}

    <!-- Header -->
    <div class="header bg-gradient-primary pb-9 pt-5 pt-md-7">
        <div class="container-fluid">
            <div class="header-body">
                <h1 class="text-white">{$CATEGORIES}</h1>
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
                            <h5 class="h3 mb-0" style="color: white;"><i class="icon fa fa-check"></i> {$SUCCESS_TITLE}</h5>
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

                    {if isset($NO_CATEGORIES)}
                        <p>{$NO_CATEGORIES}</p>
                    {else}
                        {foreach from=$ALL_CATEGORIES item=category}
                            <div class="card card-default">
                                <div class="card-header">
                                    {$category.name}
                                    {if isset($category.edit_link)}
                                        <span class="float-md-right">
                                                    <a href="{$category.edit_link}" class="btn btn-info btn-sm"><i
                                                                class="fas fa-pencil-alt"></i></a>
                                                </span>
                                    {/if}
                                </div>
                                <div class="card-body">
                                    {if isset($category.subcategories)}
                                        {foreach from=$category.subcategories item=subcategory name=categories_loop}
                                            {$subcategory.name}
                                            {if isset($subcategory.edit_link)}
                                                <span class="float-md-right">
                                                            <a href="{$subcategory.edit_link}"
                                                               class="btn btn-info btn-sm"><i
                                                                        class="fas fa-pencil-alt"></i></a>
                                                        </span>
                                            {/if}
                                            {if not $smarty.foreach.categories_loop.last}
                                                <hr/>
                                            {/if}
                                        {/foreach}
                                    {else}
                                        {$category.no_subcategories}
                                    {/if}
                                </div>
                            </div>
                        {/foreach}
                    {/if}

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