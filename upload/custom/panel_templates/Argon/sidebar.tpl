<!-- Sidenav -->
<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
        <!-- Toggler -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Brand -->
        <a class="navbar-brand" href="{$PANEL_INDEX}">{$SITE_NAME}</a>
        <!-- User -->
        <ul class="nav align-items-center d-md-none">
            <li class="nav-item dropdown">
                <a class="nav-link nav-link-icon" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-bell"></i>
                    <span class="badge badge-primary">{$NOTICES|count}</span>
                </a>
                <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
                    {if $NOTICES|count eq 0}
                        <span class="dropdown-item dropdown-header">{$NO_NOTICES}</span>

                        {else}
                        {foreach from=$NOTICES key=url item=notice}
                            <a href="{$url}" class="dropdown-item">
                                {$notice}
                            </a>
                        {/foreach}
                    {/if}
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <div class="media align-items-center">
                      <span class="avatar avatar-sm rounded-circle">
                        <img alt="{$LOGGED_IN_USER.username}" src="{$LOGGED_IN_USER.avatar}">
                      </span>
                    </div>
                </a>
                <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
                    <a href="{$LOGGED_IN_USER.panel_profile}" class="nav-item dropdown-item">{$LOGGED_IN_USER.nickname}</a>
                </div>
            </li>
        </ul>
        <!-- Collapse -->
        <div class="collapse navbar-collapse" id="sidenav-collapse-main">
            <!-- Collapse header -->
            <div class="navbar-collapse-header d-md-none">
                <div class="row">
                    <div class="col-6 collapse-brand">
                        <a href="{$SITE_HOME}">{$VIEW_SITE}</a>
                    </div>
                    <div class="col-6 collapse-close">
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                            <span></span>
                            <span></span>
                        </button>
                    </div>
                </div>
            </div>
            <!-- Navigation -->
            <ul class="navbar-nav">
                {assign var="i" value=1}
                {foreach from=$NAV_LINKS key=name item=item}
                    {if isset($item.link) && $item.link eq "divider"}
                        </ul>
                        {if $i > 1}<hr class="my-3">{/if}
                        <h6 class="navbar-heading text-muted">{$item.title}</h6>
                        <ul class="navbar-nav">
                    {else}
                        {if isset($item.items)}
                            {* Dropdown *}
                            <li class="nav-item">
                                <a class="nav-link{if isset($PARENT_PAGE) && $PARENT_PAGE eq $name} active{/if}" href="#dropdown{$i}" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="navbar-examples">
                                    {$item.icon}
                                    <span class="nav-link-text">{$item.title}</span>
                                </a>
                                <div class="collapse{if isset($PARENT_PAGE) && $PARENT_PAGE eq $name} show{/if}" id="dropdown{$i}" style="">
                                    <ul class="nav nav-sm flex-column">
                                        {if count($item.items)}
                                            {foreach from=$item.items key=subKey item=subItem}
                                                <li class="nav-item">
                                                    <a href="{$subItem.link}" class="nav-link{if $PAGE eq $subKey} active{/if}">
                                                        {$subItem.icon}
                                                        {$subItem.title}
                                                    </a>
                                                </li>
                                            {/foreach}
                                        {/if}
                                    </ul>
                                </div>
                            </li>
                        {else}
                            {* Normal link *}
                            <li class="nav-item{if $PAGE eq $name} active{/if}">
                                <a href="{$item.link}" class="nav-link" target="{$item.target}">
                                    {$item.icon}
                                    {$item.title}
                                </a>
                            </li>
                        {/if}
                    {/if}
                    {assign var="i" value=$i+1}
                {/foreach}
            </ul>
        </div>
    </div>
</nav>