{include file='header.tpl'}
<body>
{include file='sidebar.tpl'}

<div class="main-content">
    {include file='navbar.tpl'}

    <!-- Header -->
    <div class="header bg-gradient-primary pb-9 pt-5 pt-md-7">
        <div class="container-fluid">
            <div class="header-body">
                <h1 class="text-white">{$VIEWING_GIFT_CARD}</h1>
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
                    <a class="btn btn-warning" href="{$BACK_LINK}">{$BACK}</a>
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

                    <div class="table-responsive">
                        <table class="table table-striped">
                            <colgroup>
                                <col span="1" style="width: 50%;">
                                <col span="1" style="width: 50%;">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td><strong>{$GIFT_CARD_CODE}</strong></td>
                                <td>{$GIFT_CARD_CODE_VALUE}</td>
                            </tr>
                            <tr>
                                <td><strong>{$GIFT_CARD_START_BALANCE}</strong></td>
                                <td>{$GIFT_CARD_START_BALANCE_VALUE}</td>
                            </tr>
                            <tr>
                                <td><strong>{$GIFT_CARD_BALANCE_REMAINING}</strong></td>
                                <td>{$GIFT_CARD_BALANCE_REMAINING_VALUE}</td>
                            </tr>
                            <tr>
                                <td><strong>{$GIFT_CARD_ACTIVE}</strong></td>
                                <td>{if $GIFT_CARD_VOID}
                                        <i class="fas fa-times-circle fa-2x text-danger"></i>
                                    {else}
                                        <i class="fas fa-check-circle fa-2x text-success"></i>
                                    {/if}</td>
                            </tr>
                            <tr>
                                <td><strong>{$GIFT_CARD_NOTE}</strong></td>
                                <td>{$GIFT_CARD_NOTE_VALUE}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    {if $CAN_UPDATE_GIFT_CARD && !$GIFT_CARD_VOID}
                        <hr/>
                        <h5>{$ADD_CREDIT}</h5>
                        <form action="" method="post">
                            <div class="form-group">
                                <label for="inputCredit">{$CREDIT}</label>
                                <input type="number" class="form-control" id="inputCredit" name="credit"
                                       placeholder="{$CREDIT}">
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <input type="submit" class="btn btn-primary" value="{$SUBMIT}">
                            </div>
                        </form>
                        <h5>{$VOID_GIFT_CARD}</h5>
                        <button type="button" class="btn btn-danger" data-toggle="modal"
                                data-target="#deleteModal">{$VOID_GIFT_CARD}</button>
                        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
                             aria-labelledby="deleteModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="deleteModalLabel">{$VOID_GIFT_CARD}</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        {$CONFIRM_VOID_GIFT_CARD}
                                    </div>
                                    <form action="" method="post">
                                        <input type="hidden" name="action" value="void">
                                        <input type="hidden" name="token" value="{$TOKEN}">
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">{$CANCEL}</button>
                                            <button type="submit" class="btn btn-danger">{$VOID_GIFT_CARD}</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
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

    <script type="text/javascript">
        function showCancelModal() {
            $('#cancelModal').modal().show();
        }
    </script>

</body>
</html>