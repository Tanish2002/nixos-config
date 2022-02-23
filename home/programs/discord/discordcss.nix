''
/* ==UserStyle==
@name           Empty @name replaces the default template - 3/14/2020, 9:13:45 PM
@namespace      github.com/openstyles/stylus
@version        1.0.0
@description    A new userstyle
@author         Me
==/UserStyle== */
.theme-dark,
.theme-light,
:root {
    --background-primary: #141414 !important;
    --background-secondary: #111111 !important;
    --background-secondary-alt: #292929 !important;
    --background-tertiary: #0c0c0c !important;
    --background-accent: #242424 !important;
    --background-floating: black !important;
    --background-modifier-hover: rgba(255,255,255,0.01) !important;
    --background-modifier-active: rgba(255,255,255,0.03) !important;
    --background-modifier-selected: rgba(255,255,255,0.04) !important;
    --background-modifier-accent: hsla(0,0%,100%,0.06) !important;
    --channeltextarea-background: var(--background-accent) !important;
    --deprecated-card-bg: rgba(0, 0, 0, 0.2) !important;
    --deprecated-card-editable-bg: rgba(0,0,0,0.1) !important;
    --activity-card-background: var(--background-primary) !important;
    --channels-default: #9f9f9f !important;
    --text-muted: #b6b6b6 !important;
    --text-normal: #fbfbfb !important; 
    --interactive-normal: #c8c8c8 !important;
    --interactive-hover: #dcddde !important;
    --interactive-active: #fff !important;
    --interactive-muted: #747474 !important;
    --header-secondary: #c9c9c9 !important;
    --toast-background: var(--background-primary) !important;
    --toast-header: var(--background-tertiary) !important;
    --toast-contents: var(--background-secondary) !important;
    --toast-box-shadow: rgba(0, 0, 0, .2) !important;
    --toast-border: var(--background-tertiary) !important;
}

.scrollerThemed-2oenus.themeDark-2cjlUp .scroller-2FKFPG::-webkit-scrollbar-thumb,
.theme-dark .scrollerWrap-2lJEkd .scroller-2FKFPG::-webkit-scrollbar-thumb,
.listScroller-2_vlfo::-webkit-scrollbar-thumb,.CodeMirror-vscrollbar::-webkit-scrollbar-thumb,
.phoneFieldScroller-2IJUdK::-webkit-scrollbar-thumb, .infoScroller-3EYYns::-webkit-scrollbar-thumb,
.theme-dark .scrollerThemed-2oenus.themedWithTrack-q8E3vB .scroller-2FKFPG::-webkit-scrollbar-thumb,
.CodeMirror-hscrollbar::-webkit-scrollbar-thumb,
.scroller-1IfWg_::-webkit-scrollbar-thumb {
   background-color: var(--background-secondary-alt) !important;
    border-color: transparent !important;
}

.phoneFieldScroller-2IJUdK::-webkit-scrollbar-track {
   background-color: var(--background-primary) !important;
}

.scrollableContainer-2NUZem {
    background-color: var(--channeltextarea-background) !important;
}

.scroller-2FKFPG::-webkit-scrollbar-corner {
    background-color: transparent !important;
}

.scrollerThemed-2oenus.themeDark-2cjlUp .scroller-2FKFPG::-webkit-scrollbar-track,
.theme-dark .scrollerWrap-2lJEkd .scroller-2FKFPG::-webkit-scrollbar-track {
    background-color: transparent !important;
    border-color: transparent !important;
}

.theme-dark .scrollerThemed-2oenus.themedWithTrack-q8E3vB .scroller-2FKFPG::-webkit-scrollbar-track-piece {
    background-color: var(--background-secondary) !important;
    border: 4px solid var(--background-primary) !important;
    border-radius: 8px !important;
}

.scrollableContainer-2NUZem::-webkit-scrollbar-thumb {
    background-color: transparent !important;
    border-color: transparent !important;
}

.scrollableContainer-2NUZem::-webkit-scrollbar-corner {
    background-color: transparent !important;
}

.scrollableContainer-2NUZem::-webkit-scrollbar-track {
    background-color: transparent !important;
    border-color: transparent !important;
}

.scrollableContainer-2NUZem::-webkit-scrollbar-track-piece {
    background-color: transparent;
}

.scrollableContainer-2NUZem::-webkit-scrollbar-thumb {
    background-color: var(--background-secondary) !important;
    border-color: transparent !important;
}

.theme-dark .container-1D34oG {
    background-color: var(--background-primary);
}

.theme-dark .outer-1AjyKL.active-1xchHY,
.theme-dark .outer-1AjyKL.interactive-3B9GmY:hover {
    background-color: black;
}

.theme-dark .inset-3sAvek {
    background-color: var(--background-secondary);
}

.panels-j1Uci_ {
    background-color: var(--background-tertiary);
}

.theme-dark .modal-yWgWj- {
    background-color: var(--background-secondary);
    -webkit-box-shadow: 0 0 0 1px var(--background-tertiary), 0 2px 10px 0 rgba(0,0,0,.2);
    box-shadow: 0 0 0 1px var(--background-tertiary), 0 2px 10px 0 rgba(0,0,0,.2);
}

.theme-dark .friendSelected-1sa4bG {
    background-color: var(--background-modifier-hover);
}

.inspector-sdLnLS {
    background-color: var(--background-tertiary);
}

.navButtonActive-3RPAJy {
    background-color: var(--background-modifier-active) !important;
}
.navButton-3Mnpqt:hover {
    background-color: var(--background-modifier-hover);
}

.theme-dark .headerNormal-T_seeN {
    background-color: var(--background-tertiary);
}

.theme-dark .bodyInner-245q0L, /* For Stable, remove later */
.theme-dark .body-3iLsc4, /* For Canary */
.theme-dark .footer-1fjuF6 {
    background-color: var(--background-secondary);
}

.emojiItem-14v6tW.emojiItemSelected-1aLkfV {
    background-color: var(--background-modifier-hover);
}

:focus {
    outline: none !important;
}

.theme-dark .closeButton-1tv5uR {
    border-color: var(--background-secondary-alt);
}

.theme-dark .root-1gCeng {
    background-color: var(--background-secondary);
    -webkit-box-shadow: 0 0 0 1px var(--background-tertiary), 0 2px 10px 0 rgba(0,0,0,.2);
    box-shadow: 0 0 0 1px var(--background-tertiary), 0 2px 10px 0 rgba(0,0,0,.2);
}

.theme-dark .footer-3rDWdC, /* For Stable */
.theme-dark .footer-2gL1pp /* For Canary */ {
    background-color: var(--background-tertiary);
    -webkit-box-shadow: inset 0 1px 0 var(--background-modifier-active);
    box-shadow: inset 0 1px 0 var(--background-modifier-selected);
}

.theme-dark .lookFilled-1Gx00P.colorPrimary-3b3xI6 {
    background-color: var(--background-secondary-alt);
}

.theme-dark .lookFilled-1Gx00P.colorPrimary-3b3xI6:active,
.theme-dark .lookFilled-1Gx00P.colorPrimary-3b3xI6:hover {
    background-color: var(--background-accent);
}

.themeDefault-24hCdX {
    background-color: var(--background-secondary-alt);
}
.theme-dark .closeButton-1tv5uR:hover {
    background-color: var(--background-secondary-alt);
}
.theme-dark .card-FDVird:before {
    background-color: var(--background-secondary);
    border-color: var(--background-tertiary);
}

.theme-dark .game-1ipmAa {
    -webkit-box-shadow: 0 1px 0 0 var(--background-modifier-accent);
    box-shadow: 0 1px 0 0 var(--background-modifier-accent);
}

.theme-dark .notDetected-33MY4s,
.theme-light .notDetected-33MY4s {
    background-color: var(--background-secondary-alt);
}

.theme-dark .overlayToggleIconOn-3UNmty .fill-1ugeBG {
    fill: var(--background-secondary-alt);
}

.theme-dark .button-2CgfFz {
    background-color: var(--background-secondary);
    -webkit-box-shadow: 0 0 0 1px var(--background-tertiary), 0 1px 5px 0 rgba(0,0,0,.3);
    box-shadow: 0 0 0 1px var(--background-tertiary), 0 1px 5px 0 rgba(0,0,0,.3);
}

.theme-dark .checkbox-1ix_J3 {
    border-color: var(--background-secondary-alt);
}

.theme-dark .item-3eFBNF {
    -webkit-box-shadow: inset 0 -1px 0 0 var(--background-modifier-accent);
    box-shadow: inset 0 -1px 0 0 var(--background-modifier-accent);
}

.theme-dark .codeRedemptionRedirect-1wVR4b {
    background-color: var(--background-secondary);
    border-color: var(--background-tertiary);
}

.theme-dark .bar-2Qqk5Z {
    background: var(--background-secondary-alt);
}

.theme-dark .markDash-3hAolZ {
    background: var(--background-secondary-alt);
}

.theme-dark .quickMessage-1yeL4E {
    background-color: var(--background-primary);
    border-color: var(--background-modifier-hover);
}

.theme-dark .button-2CgfFz:hover {
    background-color: var(--background-primary);
    -webkit-box-shadow: 0 0 0 1px var(--background-tertiary), 0 2px 10px 0 rgba(0,0,0,.2);
    box-shadow: 0 0 0 1px var(--background-tertiary), 0 2px 10px 0 rgba(0,0,0,.2);
}

.centerButton-3CaNcJ {
    background: var(--background-secondary);
}
.centerButton-3CaNc:hover {
    background: var(--background-accent);
}

.theme-dark .tooltipGrey-1hnvTt,
.theme-light .tooltipGrey-1hnvTt {
    background-color: black;
}

.theme-dark .tooltipGrey-1hnvTt .tooltipPointer-3ZfirK,
.theme-light .tooltipGrey-1hnvTt .tooltipPointer-3ZfirK {
    border-top-color: black;
}

.theme-dark .item-3T2z1R {
    border-color: black;
}

.theme-dark .tiles-2aXG_k {
    background-color: var(--background-tertiary);
    -webkit-box-shadow: 0 2px 5px rgba(0,0,0,.2), 0 0 0 1px var(--background-tertiary);
    box-shadow: 0 2px 5px rgba(0,0,0,.2), 0 0 0 1px var(--background-tertiary);
}

.lookFilled-1Gx00P.colorGrey-2DXtkV {
    background-color: var(--background-secondary-alt);
}

.theme-dark .elevationBorderHigh-2WYJ09 {
    -webkit-box-shadow: 0 0 0 1px var(--background-tertiary), 0 2px 10px 0 rgba(0,0,0,.2);
    box-shadow: 0 0 0 1px var(--background-tertiary), 0 2px 10px 0 rgba(0,0,0,.2);
}

.theme-dark .container-3ayLPN {
    background-color: var(--background-secondary);
}
.theme-dark .option-96V44q:after {
    background: -webkit-gradient(linear,left top,right top,from(rgba(54,57,63,0)),color-stop(80%,var(--background-secondary)));
    background: linear-gradient(90deg,rgba(54,57,63,0),var(--background-secondary)80%);
}

.theme-dark .option-96V44q.selected-rZcOL- {
    background-color: var(--background-modifier-hover);
}
.theme-dark .option-96V44q.selected-rZcOL-:after {
    background: -webkit-gradient(linear,left top,right top,from(rgba(35,38,42,0)),color-stop(50%,var(--background-modifier-hover)));
    background: linear-gradient(90deg,rgba(35,38,42,0),var(--background-modifier-hover)50%);
}

.theme-dark .focused-2bY0OD {
    background-color: var(--background-tertiary);
}

.theme-dark .queryContainer-RKFJW- {
    border-bottom-color: var(--background-modifier-accent);
}

.searchResult-2N9RV4.expanded-ovgtuV {
    background-color: var(--background-primary);
}

.expanded-ovgtuV .searchResultMessage-30QnSN.hit-1CXhXT {
    background-color: var(--background-primary);
    border: 1px solid var(--background-tertiary);
}

.theme-dark .userSettingsVoice-iwdUCU .previewOverlay-2O7_KC {
    background-color: var(--background-secondary);
    border-color: var(--background-tertiary);
}

.theme-dark .message-2qRu38 {
    background-color: var(--background-secondary);
    -webkit-box-shadow: 0 0 0 1px var(--background-tertiary), 0 2px 10px 0 rgba(0,0,0,.2);
    box-shadow: 0 0 0 1px var(--background-tertiary), 0 2px 10px 0 rgba(0,0,0,.2);
}

.result-3w1ZcL {
    background-color: var(--background-accent) !important;
}

.theme-dark .autocomplete-1vrmpx {
    background-color: var(--background-secondary);
}

.theme-dark .selectorSelected-1_M1WV {
    background-color: var(--background-modifier-active);
}

.theme-dark .optionActive-KkAdqq {
    background: var(--background-modifier-hover);
}

.theme-dark .popout-2sKjHu {
    border-color: var(--background-tertiary);
    background: var(--background-tertiary);
}

.theme-dark .autocompleteArrow-Zxoy9H,
.theme-dark .header-2bNvm4 {
    background-color: var(--background-tertiary);
}

.theme-dark .container-VSDcQc .sectionTag-pXyto9 {
    background-color: var(--background-secondary);
}

.theme-dark .row-rrHHJU.selected-1pIgLL {
    background: -webkit-gradient(linear,left top,right top,from(var(--background-modifier-active)),to(transparent));
    background: linear-gradient(90deg,var(--background-modifier-active),transparent);
}

.theme-dark .autocompleteArrow-Zxoy9H,
.theme-dark .autocompleteShadow-iiGWFU {
    -webkit-box-shadow: 0 2px 10px 0 rgba(0,0,0,.2), 0 0 0 1px var(--background-tertiary);
    box-shadow: 0 2px 10px 0 rgba(0,0,0,.2), 0 0 0 1px var(--background-tertiary);
}

.positionTop-3e-X1p .sectionTag-pXyto9 {
    border-radius: 0;
}

.emptyChannelIcon-3IXV5M {
    background-color: var(--background-secondary);
}

#bd-pub-button {
    background-color: var(--background-secondary-alt);
}

.emojiItem-14v6tW .emojiItemImageLoading-1yEIxx, /* Stable */
.theme-dark .imageLoading-bpSr0M /* Canary */ {
    background-image: none;
    background-color: var(--background-accent);
    border-radius: 30%;
}

.css-1a8reka-control {
    border-color: var(--background-tertiary) !important;
}

.theme-dark .row-2okwlC {
    -webkit-box-shadow: inset 0 -1px 0 var(--background-modifier-accent);
    box-shadow: inset 0 -1px 0 var(--background-modifier-accent);
}

.css-n57xjs-menu {
    background-color: var(--background-primary);
    box-shadow: var(--background-tertiary) 0 1px 5px 0;
    border-color: var(--background-tertiary);
}

.theme-dark .separator-XqIyoz {
    background-color: var(--background-tertiary);
}

.toast {
    background-color: black !important;
    box-shadow: none !important;
}

.userPopout-3XzG_A {
    -webkit-box-shadow: 0 2px 10px 0 rgba(0,0,0,.2), 0 0 0 1px var(--background-tertiary);
    box-shadow: 0 2px 10px 0 rgba(0,0,0,.2), 0 0 0 1px var(--background-tertiary);
}

.theme-dark .passthroughSelected-1Eq0Kl {
    background: var(--background-accent);
}

.theme-dark .pageWrapper-1PgVDX {
    background-color: var(--background-secondary);
}

.theme-dark .card-3DjzTQ,
.theme-dark .iconMask-3b8GzQ {
    background-color: var(--background-primary);
}

.theme-dark .inviteRow-2L02ae:hover {
    background-color: var(--background-modifier-selected);
}

.lookFilled-1Gx00P.colorGrey-2DXtkV:hover {
    background-color: var(--background-accent);
}

.theme-dark .tierBody-x9kBBp {
    background-color: var(--background-secondary);
}

.theme-dark .tierHeaderLocked-1a2opw {
    background-color: var(--background-tertiary);
}

.theme-dark .tierHeaderUnlocked-2RhWqn {
    background-color: var(--background-tertiary);
}

.theme-dark .background-3xPPFc {
    color: var(--background-accent);
}

.theme-dark .tierInProgress-3mBoXq {
    background-color: var(--background-secondary-alt);
}

.tierLock-1oFMOZ {
    color: var(--background-accent);
}

.theme-dark .headerClickable-2IVFo9,
.theme-dark .headerDefault-1wrJcN {
    background-color: var(--background-modifier-hover);
}

.theme-dark .auditLog-3jNbM6 {
    border-color: var(--background-modifier-selected);
}

.theme-dark .headerExpanded-CUEwZ5 {
    background-color: var(--background-modifier-active);
}

.theme-dark .changeDetails-bk98pu {
    background-color: var(--background-primary);
}

.theme-dark .divider-1pnAR2 {
    background-color: var(--background-modifier-active);
}

.theme-dark .emojiAliasInput-1y-NBz .emojiInput-1aLNse {
    background-color: var(--background-tertiary);
}

.container-2VW0UT.elevationHigh-1PneE4 {
    background-color: var(--background-floating) !important;
}

.theme-dark .popoutList-T9CKZQ {
    background: var(--background-secondary);
}

.theme-dark .elevationBorderLow-2qgTRQ {
    -webkit-box-shadow: 0 0 0 1px var(--background-tertiary), 0 1px 5px 0 rgba(0,0,0,.3);
    box-shadow: 0 0 0 1px var(--background-tertiary), 0 1px 5px 0 rgba(0,0,0,.3);
}

.theme-dark .selectableItem-1MP3MQ:hover {
    background-color: var(--background-modifier-hover);
}

.theme-dark .lookFilled-1Gx00P.colorPrimary-3b3xI6:disabled {
    background-color: var(--background-secondary-alt);
}

.theme-dark .uploadModal-2ifh8j {
    background-color: var(--background-secondary);
    -webkit-box-shadow: 0 0 0 1px var(--background-tertiary), 0 2px 10px 0 rgba(0,0,0,.2);
    box-shadow: 0 0 0 1px var(--background-tertiary), 0 2px 10px 0 rgba(0,0,0,.2);
}

.theme-dark .footer-3mqk7D {
    background-color: var(--background-tertiary);
    -webkit-box-shadow: inset 0 1px 0 var(--background-modifier-accent);
    box-shadow: inset 0 1px 0 var(--background-modifier-accent);
}

.attachment-33OFj0 {
    border-color: transparent;
    background-color: var(--background-secondary);
}

.wrapper-2aW0bm {
    background-color: var(--background-secondary);
}

.theme-dark .calendarPicker-2yf6Ci .react-datepicker {
    background-color: var(--background-secondary);
}

.theme-dark .calendarPicker-2yf6Ci .react-datepicker__header {
    background-color: var(--background-secondary);
    border-color: var(--background-accent);
}
.theme-dark .calendarPicker-2yf6Ci .react-datepicker__week .react-datepicker__day:last-of-type {
    border-right-color: var(--background-tertiary);
}

.theme-dark .calendarPicker-2yf6Ci .react-datepicker__day {
    border-top-color: var(--background-tertiary);
    border-left-color: var(--background-tertiary);
}

.theme-dark .calendarPicker-2yf6Ci .react-datepicker__day.react-datepicker__day--disabled,
.theme-dark .calendarPicker-2yf6Ci .react-datepicker__day.react-datepicker__day--disabled:hover {
    background-color: black;
}

.theme-dark .streamPreview-2-WUWT {
    background-color: black;
}

.optionContainer-15srkc {
    background: var(--background-tertiary);
}

.optionContainer-15srkc:hover {
    background: black;
}

.card-1yV8cG {
    background-color: var(--background-secondary);
}

.card-1yV8cG:hover {
    background-color: var(--background-tertiary);
}

.theme-dark .notches-1sAcEM.gray-3_LNYR {
    background: url("data:image/svg+xml;charset=utf-8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='20' fill='%23141414'%3E%3Cpath fill-rule='evenodd' d='M0 0h8v20H0V0zm4 2a2 2 0 00-2 2v12a2 2 0 104 0V4a2 2 0 00-2-2z'/%3E%3C/svg%3E");
}

.theme-dark .progress-1IcQ3A {
    background-color: var(--background-accent);
}

.input-2VB9rf {
    background-color: var(--background-tertiary);
}

.quickswitcher-3JagVE {
    -webkit-box-shadow: 0 2px 10px rgba(0,0,0,.2), 0 0 0 1px var(--background-tertiary);
    box-shadow: 0 2px 10px rgba(0,0,0,.2), 0 0 0 1px var(--background-tertiary);
}

.theme-dark .calendarPicker-2yf6Ci .react-datepicker__day--disabled,
.theme-dark .calendarPicker-2yf6Ci .react-datepicker__day--outside-month {
    background-color: var(--background-modifier-selected);
}

.theme-dark .searchAnswer-3Dz2-q, .theme-dark .searchFilter-2ESiM3 {
    background-color: var(--background-primary);
}

.theme-light .action-1lSjCi {
    border-color: rgba(0,0,0,.1);
    background: var(--background-tertiary);
}

.colorStandard-2KCXvj {
    color: lightgray !important;
}

.header-3ZP1MY {
    color: lightgray;
}

.input-1mgnkM {
    color: white !important;
    border-bottom-color: #e3e5e8 !important;
}

.cancelButton-RGXhAE {
    color: white !important;
}

.description-QF3836 {
    color: white !important;
}

.theme-dark .notice-2X5hT5 {
    background-color: black;
}

#app-mount .standardSidebarView-3F1I7i .payment-info .description-3_Ncsb,
#app-mount .standardSidebarView-3F1I7i .paymentSourceRow-3FbcL_ .subText-V8PTt8,
#app-mount .standardSidebarView-3F1I7i .userSettingsAccount-2eMFVR div:nth-child(2) > div:nth-child(2) > .viewBody-2Qz-jg {
    transition: all 150ms cubic-bezier(0.550, 0.085, 0.680, 0.530);
    filter: blur(4px);
    opacity: 0.8;
}

#app-mount .standardSidebarView-3F1I7i .payment-info .description-3_Ncsb:hover,
#app-mount .standardSidebarView-3F1I7i .paymentSourceRow-3FbcL_ .subText-V8PTt8:hover,
#app-mount .standardSidebarView-3F1I7i .userSettingsAccount-2eMFVR div:nth-child(2) > div:nth-child(2) > .viewBody-2Qz-jg:hover {
    transition: all 150ms cubic-bezier(0.55, 0.09, 0.68, 0.53);
    filter: none;
    opacity: 1;
}

.theme-light .layer-3QrUeG:first-of-type::before {
    content: "You need to have the dark mode enabled for this theme to work properly. To enable it, go in settings > appearance.";
    position: fixed;
    display: block;
    width: 400px;
    height: 30px;
    top: 50%;
    left: 50%;
    background: var(--background-primary);
    -ms-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    color: white;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 10px rgba(240, 71, 71, 0.3);
    border: 3px solid #F04747;
    z-index: 2;
}

.theme-light .preview-2nSL_2.cardPrimaryOutline-29Ujqw+.marginTop40-i-78cZ .radioGroup-1GBvlr .cardPrimaryEditable-3KtE4g:first-of-type,
.theme-light .preview-2nSL_2.cardPrimaryOutline-29Ujqw+.marginTop40-i-78cZ .radioGroup-1GBvlr .item-26Dhrx:first-of-type {
    animation: flash 1s ease infinite;
    background: #F04747;
    border-color: #F04747;
    color: white;
}

.theme-light .app-2rEoOp .base-3dtUhz {
    overflow: visible;
}

.theme-light .app-2rEoOp .container-3baos1 > .noWrap-3jynv6 > .button-14-BFJ:nth-child(3) {
    position: fixed;
    left: 50%;
    top: 50%;
    -ms-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    margin-top: 70px;
    width: 230px;
    height: 40px;
    visibility: visible !important;
    background: #F04747 !important;
    border-radius: 5px;
    box-shadow: 0 2px 10px rgba(240, 71, 71, 0.3);
    animation: flash 1s ease infinite;
    opacity: 1;
}

.theme-light .app-2rEoOp .container-3baos1 > .noWrap-3jynv6 > .button-14-BFJ:nth-child(3)::before {
    position: absolute;
    z-index: 10000;
    content: "Settings";
    display: flex;
    justify-content: center;
    align-items: center;
    width: 230px;
    height: 14px;
    border-radius: 5px;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    visibility: visible !important;
    font-size: 17px;
    font-weight: 700;
    color: white;
    text-align: center;
}

.theme-light .app-2rEoOp .layer-3QrUeG:first-of-type *,
.theme-light .app-2rEoOp .layer-3QrUeG:first-of-type *::after,
.theme-light .app-2rEoOp .layer-3QrUeG:first-of-type *::before {
    visibility: hidden !important;
}

.platform-win.theme-light .item-PXvHYJ:nth-of-type(20),
html:not(.platform-win).theme-light .item-PXvHYJ:nth-of-type(19) {
    transition: 200ms cubic-bezier(0, 0, 0, 1);
    background: red !important;
    border: 2px solid #fff;
}

.theme-light .app-2rEoOp .layer-3QrUeG:first-of-type {
    background-size: 30%;
    background-color: var(--background-secondary) !important;
}

.xenoLib-notification-content {
    background: var(--background-tertiary) !important;
    border: 1px solid black !important;
}

.theme-dark .perksModal-fSYqOq {
    background-color: var(--background-tertiary);
}

.theme-dark .barBackground-2EEiLw {
    background-color: var(--background-accent);
}

.theme-light .input-UJ9Tr3 {
    color: lightgray;
    border-bottom-color: lightgray;
}

.theme-dark .tierBody-16Chc9 {
    background-color: var(--background-secondary);
}

.theme-dark .tierMarkerBackground-3q29am {
    background-color: var(--background-accent);
}

.tierMarkerAccomplished-2MiXeg,
.tierMarkerInProgress-24LMzJ {
    background: var(--background-primary) !important;
}

.theme-dark .tierHeaderLocked-1s2JJz {
    background-color: var(--background-primary);
}

.theme-dark .perk-2WeBWW {
    background-color: var(--background-accent);
}

.theme-dark .everyonePopout-nEbJY3 {
    background-color: black;
    -webkit-box-shadow: 0 2px 10px 0 var(--background-modifier-active);
    box-shadow: 0 2px 10px 0 var(--background-modifier-active);
}

.theme-dark .footer-2aTx0s {
    background-color: var(--background-tertiary);
}

.theme-dark .iconWrapper-3LVgIo {
    background: var(--background-accent);
}

.theme-dark .divider-23swzi {
    background-color: var(--background-accent);
}

.blockquoteDivider-2hH8H6 {
    background-color: rgba(100, 100, 100, 0.4);
}

.theme-dark .selectorButton-wjWyGe:not(.selectorButtonSelected-336oUc):hover {
    background-color: var(--background-modifier-hover);
}

.theme-dark .hoverablePayment-Yc6mK7:hover {
    background-color: transparent;
}

.theme-dark .expandedInfo-3kfShd {
    background-color: var(--background-primary);
}

.theme-dark .payment-xT17Mq {
    background-color: var(--background-secondary);
}

.theme-dark .paginator-166-09 {
    background: var(--background-secondary);
}

.theme-dark .paymentPane-3bwJ6A {
    background-color: var(--background-secondary);
}

.theme-dark .bottomDivider-1K9Gao {
    border-bottom-color: var(--background-tertiary);
}

.theme-dark .pageButtonNext-V2kUq0,
.theme-dark .pageButtonPrev-1Y-47D {
    border-color: var(--background-accent);
}

.theme-dark .pageIndicator-1gAbyA {
    border-color: var(--background-accent);
}

.theme-dark .paginator-2CA79G {
    color: white;
}

.theme-dark .paymentHeader-3QlZQi {
    border-color: var(--background-accent);
}

.ace_scroller {
    background-color: var(--background-secondary) !important;
}

#bd-customcss-detach-container #bd-customcss-attach-controls,
.contentRegion-3nDuYy #bd-customcss-attach-controls {
    background: var(--background-tertiary) !important;
    box-shadow: 0 1px 0 0 var(--background-accent)inset !important;
}

.bd-detached-css-editor #bd-customcss-attach-controls button,
.standardSidebarView-3F1I7i #bd-customcss-attach-controls button {
    background: var(--background-secondary-alt);
    margin: 0 0 0 10px;
    border-radius: 3px !important;
    border: none !important;
}

.ace-monokai .ace_gutter {
    background: var(--background-tertiary) !important;
}

.ace-monokai {
    background-color: var(--background-secondary) !important;
}

#bd-customcss-attach-controls .help-text .inline {
    background: var(--background-secondary-alt) !important;
}

.bd-detached-css-editor #bd-customcss-attach-controls button:hover,
.standardSidebarView-3F1I7i #bd-customcss-attach-controls button:hover {
    background: var(--background-accent) !important;
}

.theme-dark .sectionAccountCredit-1uNhnJ,
.theme-dark .subscriptionDetails-1dUmjl {
    border-color: var(--background-accent);
}

.ace-monokai .ace_marker-layer .ace_selection {
    background: var(--background-modifier-selected) !important;
}

#app-mount #bd-customcss-attach-controls .checkbox-group li {
    margin-top: 0;
}

#app-mount #bd-customcss-attach-controls {
    background: var(--background-secondary);
    box-shadow: inset 0 0 0 100vmax var(--background-secondary);
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px;
    box-sizing: border-box;
}

#app-mount .help-text,
#app-mount span[style="font-size: 10px; margin-left: 5px;"] {
    display: none;
}

#app-mount #bd-customcss-detach-container .editor-wrapper {
    height: calc(100% + 41px);
}

#app-mount #bd-customcss-attach-controls {
    height: auto;
}

.bd-search-wrapper {
    background-color: var(--background-accent) !important;
}

.bd-switch {
    background-color: var(--background-secondary-alt) !important;
}

.bd-switch-checked {
    background-color: var(--bd-blue) !important;
}

.theme-dark .bd-addon-list .bd-addon-card {
    background-color: var(--background-modifier-active) !important;
    color: #f6f6f7;
    border-color: var(--background-modifier-accent) !important;
}

.theme-dark .bd-addon-list .bda-header {
    color: #f6f6f7;
    border-bottom-color: var(--background-modifier-accent) !important;
}

.theme-dark .bd-addon-list .bd-card-footer {
    border-top-color: var(--background-modifier-accent) !important;
}

.bd-select-transparent .bd-select-options {
    border: 1px solid var(--background-tertiary) !important;
}

.bd-select .bd-select-options {
    background: var(--background-secondary) !important;
}

.bd-select .bd-select-option.selected,
.bd-select .bd-select-option:hover {
    background: var(--background-primary);
}

#bd-settingspane-container .ui-switch-item .style-description {
    border-bottom: 1px solid var(--background-modifier-accent);
}

.theme-dark #bd-settings-sidebar .ui-tab-bar-separator {
    background-color: var(--background-modifier-accent);
}

.theme-dark #bd-settings-sidebar .ui-tab-bar-item:hover {
    background-color: var(--background-modifier-hover);
}

.theme-dark #bd-settings-sidebar .ui-tab-bar-item.selected {
    background-color: var(--bd-blue) !important;
}

.bd-toast {
    background-color: black !important;
    box-shadow: none !important;
}

.theme-dark .notches-1sAcEM.black-1D3qCv {
    background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='20' fill='%23000000'%3E%3Cpath fill-rule='evenodd' d='M0 0h8v20H0V0zm4 2a2 2 0 00-2 2v12a2 2 0 104 0V4a2 2 0 00-2-2z'/%3E%3C/svg%3E");
}

foreignObject[mask="url(#svg-mask-status-offline)"] .status-1AY8sU {
    background-color: rgb(60, 60, 60) !important;
}

.status-1XNdyw[aria-label="Offline"] rect[height="15"][width="10"],
rect[mask="url(#svg-mask-status-typing)"][fill="#747f8d"],
rect[mask="url(#svg-mask-status-offline)"] {
    fill: rgb(60, 60, 60) !important;
}

.videoWrapper-2v09vt {
    background-color: black !important;
}

.cta-2DQ2ez {
    background-color: var(--background-accent);
}

.spinner-2UBgbJ {
    background: var(--background-tertiary);
}

.participantsButton-KYW-IW {
    background: var(--background-accent);
}

.participantsButton-KYW-IW:hover {
    background: var(--background-secondary-alt);
}

.css-1b86x2o-control {
    background-color: var(--background-tertiary) !important;
}

.css-123uooi-menu {
    background-color: var(--background-tertiary) !important;
}

.css-1o55ng5-control {
    background-color: var(--background-tertiary) !important;
}

.css-9wh895-control {
    background-color: var(--background-tertiary) !important;
}

.button-3WOKuZ {
    background-color: var(--background-accent) !important;
}

.button-3WOKuZ:hover {
    background-color: var(--background-secondary-alt) !important;
}

.tile-2gi3tr {
    background-color: var(--background-tertiary) !important;
}

.spotify-seek-bar {
    background: var(--background-modifier-accent);
    height: 1px !important;
}

.powercord-spotify.hover .spotify-seek:not(.no-premium) .spotify-seek-bar {
    height: 4px !important;
}

.powercord-quickcss .CodeMirror-selected {
    background-color: rgba(255,255,255, .1) !important;
}

.theme-dark .partyMemberOverflow-lXnzvu {
    background-color: var(--background-accent);
}

.theme-dark .wrapperAudio-1jDe0Q {
    border-color: transparent !important;
}

.theme-dark .invite-18yqGF {
    background: var(--background-modifier-active) !important;
    border-color: var(--background-modifier-active) !important;
}

.lookFilled-1Gx00P.colorGrey-2DXtkV:disabled {
    background-color: var(--background-accent);
}

.theme-dark .header-2B7Ri8 {
    background-color: var(--background-secondary);
}

.theme-dark .content-2KAjC9 {
    background-color: var(--background-primary);
}

.theme-dark .userList-1kLH8B {
    border-color: var(--background-tertiary);
}

.moreUsers-1s5Her {
    background-color: var(--background-accent);
}

.theme-dark .applicationStreamingPreviewWrapper-8QqvVY {
    background-color: var(--background-primary);
}

.theme-dark .bubble-3we2di {
    background-color: var(--background-accent);
}

.theme-dark .bubble-3we2di:before {
    border-top-color: var(--background-accent);
}

.theme-dark .popout-1k352f {
    background-color: var(--background-tertiary);
}

.theme-dark .memberListItem-2ZX2pl:not(.popoutDisabled-xucru2):hover {
    background-color: var(--background-modifier-hover);
}

.pictureInPictureVideo-2iKsGg {
    background: black;
}

.theme-dark .tile-2OwFgW {
    background-color: var(--background-tertiary);
}

.theme-dark .tile-2OwFgW:hover {
    background-color: black;
}

.theme-dark .keyboardShortcutsModal-3piNz7 {
    background-color: var(--background-primary);
}

.theme-dark .keybindShortcut-1BD6Z1 span {
    -webkit-box-shadow: inset 0 -4px 0 var(--background-accent);
    box-shadow: inset 0 -4px 0 var(--background-accent);
    border: 1px solid var(--background-tertiary);
    background-color: var(--background-secondary-alt);
}

.theme-dark .dim-1l4L4y span {
    background-color: var(--background-secondary-alt);
}

.toolbar-2bjZV7:before {
    border-top: 8px solid black;
}

.toolbar-2bjZV7 {
    background-color: black;
}

.theme-dark .emptyHintCard-2mUdMe {
    background-color: var(--background-accent);
}

.theme-dark .multipleIconWrapper-DfGWrz {
    background-color: var(--background-accent);
}

#dv-mount {
    background-color: var(--background-secondary) !important;
}

.theme-dark #MemberCount {
    background: var(--background-secondary) !important;
}

.theme-dark .contentWrapper-3WC1ID {
    background: var(--background-secondary);
}

.connectedAccountVerifiedIcon-3aZz_K .flowerStar-1GeTsn path {
    fill: var(--background-accent) !important;
}

.theme-dark .description-11DmNu, .theme-dark .descriptionUsername-J_75O8 {
    color: var(--interactive-normal);
}

.theme-dark .iconForeground-1w5n7R {
    fill: var(--interactive-normal);
}

.theme-dark .invalidPoop-pnUbq7 {
    background-color: var(--background-secondary);
}

.theme-dark .placeholder-1kJjXI {
    background: var(--background-accent);
}

.theme-dark .container-2x5lvQ section {
    background-color: var(--background-secondary);
}

.theme-dark .container-2x5lvQ .header-2C89wJ {
    background-color: var(--background-tertiary);
}

.container-2x5lvQ {
    border: 1px solid var(--background-tertiary);
}

.theme-dark .container-1If-HZ, .theme-dark .reactors-Blmlhw {
    background-color: var(--background-secondary);
}

.theme-dark .sidebar-1-SQro {
    background: var(--background-tertiary);
}

.theme-dark .reactionSelected-1pqISm {
    background-color: var(--background-modifier-active);
}

.theme-dark .popout-38lTFE {
    background-color: black;
}

.theme-dark .enabled-1t_Gxm:hover {
    background-color: var(--background-modifier-selected);
}

.theme-dark .memberListItem-31QoHj:not(.popoutDisabled-2RK7MF):hover {
    background-color: var(--background-modifier-selected);
}

.theme-dark .quickSelectPopout-X1hvgV {
    background: var(--background-secondary);
    border: 1px solid var(--background-tertiary);
}

.theme-dark .quickSelectPopoutOption-opKBx9:hover {
    background-color: var(--background-modifier-hover);
}

.theme-dark .previewContainer-12UlHl {
    background-color: var(--background-accent);
}

.theme-dark .watchButton-2SbJEo {
    border-color: var(--background-accent);
}

.overflow-3zpvTV {
    background-color: var(--background-accent);
}

.scroller-1JpcIc {
    background-color: var(--background-primary);
}

.theme-dark .scroller-1-nKid {
    background: var(--background-primary);
}

.theme-dark .bodySection-jqkkIP, .theme-light .bodySection-jqkkIP {
    background-color: var(--background-modifier-active);
    border-top-color: var(--background-modifier-accent);
}

.theme-dark .row-1bU71H {
    background-color: var(--background-modifier-active);
}

.theme-dark .divider-21LyPb {
    border-color: var(--background-modifier-accent);
}

.theme-dark .purchaseUnitOperatingSystem-cnbJPz {
    color: var(--text-normal);
}

.searchBox {
    background-color: var(--background-tertiary) !important;
}

.discordTweaksSettings .tweaks .tweakCard {
    background-color: var(--background-modifier-selected) !important;
}

.theme-dark .guildIconImage-3qTk45 {
    background-color: var(--background-accent);
}

.theme-dark .installSize-1eXbBX {
    background-color: var(--background-accent);
}

.theme-dark .background-yZEZik {
    stroke: var(--background-accent);
}

.theme-dark .installationPath-3cStrB {
    -webkit-box-shadow: 0 1px 0 0 var(--background-modifier-accent);
    box-shadow: 0 1px 0 0 var(--background-modifier-accent);
}

.theme-dark .entitledHeader-3LRNDT, .theme-light .entitledHeader-3LRNDT {
    background-color: var(--background-secondary);
}

.theme-dark .verificationBlock-1Chfpc:hover {
    background-color: var(--background-modifier-hover);
}

.theme-dark .verificationBlock-1Chfpc {
    border: 1px solid var(--background-tertiary);
}

.theme-dark .phoneField-38N1bJ {
    background-color: var(--background-primary);
}

.theme-dark .phoneField-38N1bJ .inputField-aNPXsv {
    background-color: var(--background-primary);
}

.theme-dark .phoneField-38N1bJ .countryButton-3xq3Ts {
    background-color: var(--background-accent);
}

.theme-dark .phoneField-38N1bJ .countryButton-3xq3Ts:hover {
    background-color: var(--background-secondary-alt);
}

.theme-dark .input-3yHnCz {
    background-color: var(--background-accent);
}

.theme-dark .reactorDefault-1IUqMZ {
    -webkit-box-shadow: inset 0 -1px 0 var(--background-modifier-accent);
    box-shadow: inset 0 -1px 0 var(--background-modifier-accent);
}

.content-2Sfaij:hover .cta-2DQ2ez {
    background-color: var(--background-secondary-alt);
}
''