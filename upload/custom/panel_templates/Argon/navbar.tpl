<!-- Top navbar -->
<nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
    <div class="container-fluid">
        <!-- Brand -->
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="{$SITE_HOME}" target="_blank">{$VIEW_SITE}</a>
        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
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
    </div>
</nav>
