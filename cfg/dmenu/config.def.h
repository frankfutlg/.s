static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 1;                    /* -c option; centers dmenu on screen */
static int min_width = 384;                    /* minimum width when centered */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"cherry:size=9:antialias=true:autohint=true",
	"Noto Color Emoji:size=9:antialias=true:autohint=true"
};
static const char *prompt      = "find:";      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#101400", "#fbffed" },
	[SchemeSel] = { "#101400", "#f0f5e1" },
	[SchemeOut] = { "#98bf1d", "#fbffed" },
};
/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines      = 5;
static unsigned int columns    = 2;

/* -h option; minimum height of a menu line */
static unsigned int lineheight = 34;
static unsigned int min_lineheight = 34;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
