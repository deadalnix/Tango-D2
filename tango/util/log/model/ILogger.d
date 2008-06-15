/*******************************************************************************

        copyright:      Copyright (c) 2004 Kris Bell. All rights reserved

        license:        BSD style: $(LICENSE)
      
        version:        Initial release: May 2004
        
        author:         Kris

*******************************************************************************/

module tango.util.log.model.ILogger;

/*******************************************************************************

*******************************************************************************/

interface ILogger
{
        enum Level {Trace=0, Info, Warn, Error, Fatal, None};

        /***********************************************************************
        
                Is this logger enabed for the specified Level?

        ***********************************************************************/

        bool enabled (Level level = Level.Fatal);

        /***********************************************************************

                Append a trace message

        ***********************************************************************/

        void trace (char[] fmt, ...);

        /***********************************************************************

                Append a trace message

        ***********************************************************************/

        //void trace (lazy void dg);

        /***********************************************************************

                Append an info message

        ***********************************************************************/

        void info (char[] fmt, ...);
        
        /***********************************************************************

                Append an info message

        ***********************************************************************/

        //void info (lazy void dg);

        /***********************************************************************

                Append a warning message

        ***********************************************************************/

        void warn (char[] fmt, ...);

        /***********************************************************************

                Append a warning message

        ***********************************************************************/

        //void warn (lazy void dg);
        
        /***********************************************************************

                Append an error message

        ***********************************************************************/

        void error (char[] fmt, ...);

        /***********************************************************************

                Append an error message

        ***********************************************************************/

        //void error (lazy void dg);

        /***********************************************************************

                Append a fatal message

        ***********************************************************************/

        void fatal (char[] fmt, ...);

        /***********************************************************************

                Append a fatal message

        ***********************************************************************/

        //void fatal (lazy void dg);

        /***********************************************************************

                Return the name of this ILogger (sans the appended dot).
       
        ***********************************************************************/

        char[] name ();

        /***********************************************************************
        
                Return the Level this logger is set to

        ***********************************************************************/

        Level level ();

        /***********************************************************************
        
                Set the current level for this logger (and only this logger).

        ***********************************************************************/

        ILogger level (Level l);

        /***********************************************************************
        
                Is this logger additive? That is, should we walk ancestors
                looking for more appenders?

        ***********************************************************************/

        bool additive ();

        /***********************************************************************
        
                Set the additive status of this logger. See isAdditive().

        ***********************************************************************/

        ILogger additive (bool enabled);

        /***********************************************************************
        
                Send a message to this logger via its appender list.

        ***********************************************************************/

        ILogger append (Level level, lazy char[] exp);
}
