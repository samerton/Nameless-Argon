<footer class="footer">
    <div class="container-fluid">
        <hr />
        <div class="row">
            <div class="col-md-9">
                {*
                    We ask that you keep a link back to our website or Github somewhere on your website
                *}
                <ul class="nav nav-pills">
                    <li class="nav-item dropup">
                        <a class="nav-link dropdown-toggle nl-copyright" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">&copy; NamelessMC {'Y'|date}</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="https://github.com/NamelessMC/Nameless" target="_blank"><i class="fab fa-github fa-fw"></i> {$SOURCE}</a>
                            <a class="dropdown-item" href="https://namelessmc.com" target="_blank"><i class="fas fa-life-ring fa-fw"></i> {$SUPPORT}</a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="col-md-3">
                <div class="float-md-right">
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a href="#" class="nav-link">{$PAGE_LOAD_TIME}</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>