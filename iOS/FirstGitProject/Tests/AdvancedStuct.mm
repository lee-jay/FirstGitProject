//
//  AdvancedStuct.m
//  FirstGitProject
//
//  Created by LiJun on 3/3/16.
//  Copyright © 2016 JayLee. All rights reserved.
//

#import "AdvancedStuct.h"

typedef struct TimeUnit {
    
    // Handy constants for conversion methods
    static const long C0 = 1L;
    static const long C1 = C0 * 1000L;
    static const long C2 = C1 * 1000L;
    static const long C3 = C2 * 1000L;
    static const long C4 = C3 * 60L;
    static const long C5 = C4 * 60L;
    static const long C6 = C5 * 24L;
    
    static const long MAX = INT64_MAX;
    
    struct NANOSECONDS {
        long toNanos(long d)   { return d; }
        long toMicros(long d)  { return d/(C1/C0); }
        long toMillis(long d)  { return d/(C2/C0); }
        long toSeconds(long d) { return d/(C3/C0); }
        long toMinutes(long d) { return d/(C4/C0); }
        long toHours(long d)   { return d/(C5/C0); }
        long toDays(long d)    { return d/(C6/C0); }
        long convert(long d, TimeUnit u) { return u.toNanos(d); }
        int excessNanos(long d, long m) { return (int)(d - (m*C2)); }
    };
    struct MICROSECONDS {
        long toNanos(long d)   { return x(d, C1/C0, MAX/(C1/C0)); }
        long toMicros(long d)  { return d; }
        long toMillis(long d)  { return d/(C2/C1); }
        long toSeconds(long d) { return d/(C3/C1); }
        long toMinutes(long d) { return d/(C4/C1); }
        long toHours(long d)   { return d/(C5/C1); }
        long toDays(long d)    { return d/(C6/C1); }
        long convert(long d, TimeUnit u) { return u.toMicros(d); }
        int excessNanos(long d, long m) { return (int)((d*C1) - (m*C2)); }
    };
    struct MILLISECONDS {
        long toNanos(long d)   { return x(d, C2/C0, MAX/(C2/C0)); }
        long toMicros(long d)  { return x(d, C2/C1, MAX/(C2/C1)); }
        long toMillis(long d)  { return d; }
        long toSeconds(long d) { return d/(C3/C2); }
        long toMinutes(long d) { return d/(C4/C2); }
        long toHours(long d)   { return d/(C5/C2); }
        long toDays(long d)    { return d/(C6/C2); }
        long convert(long d, TimeUnit u) { return u.toMillis(d); }
        int excessNanos(long d, long m) { return 0; }
    };
    struct SECONDS {
        long toNanos(long d)   { return x(d, C3/C0, MAX/(C3/C0)); }
        long toMicros(long d)  { return x(d, C3/C1, MAX/(C3/C1)); }
        long toMillis(long d)  { return x(d, C3/C2, MAX/(C3/C2)); }
        long toSeconds(long d) { return d; }
        long toMinutes(long d) { return d/(C4/C3); }
        long toHours(long d)   { return d/(C5/C3); }
        long toDays(long d)    { return d/(C6/C3); }
        long convert(long d, TimeUnit u) { return u.toSeconds(d); }
        int excessNanos(long d, long m) { return 0; }
    };
    struct MINUTES {
        long toNanos(long d)   { return x(d, C4/C0, MAX/(C4/C0)); }
        long toMicros(long d)  { return x(d, C4/C1, MAX/(C4/C1)); }
        long toMillis(long d)  { return x(d, C4/C2, MAX/(C4/C2)); }
        long toSeconds(long d) { return x(d, C4/C3, MAX/(C4/C3)); }
        long toMinutes(long d) { return d; }
        long toHours(long d)   { return d/(C5/C4); }
        long toDays(long d)    { return d/(C6/C4); }
        long convert(long d, TimeUnit u) { return u.toMinutes(d); }
        int excessNanos(long d, long m) { return 0; }
    };
    struct HOURS {
        long toNanos(long d)   { return x(d, C5/C0, MAX/(C5/C0)); }
        long toMicros(long d)  { return x(d, C5/C1, MAX/(C5/C1)); }
        long toMillis(long d)  { return x(d, C5/C2, MAX/(C5/C2)); }
        long toSeconds(long d) { return x(d, C5/C3, MAX/(C5/C3)); }
        long toMinutes(long d) { return x(d, C5/C4, MAX/(C5/C4)); }
        long toHours(long d)   { return d; }
        long toDays(long d)    { return d/(C6/C5); }
        long convert(long d, TimeUnit u) { return u.toHours(d); }
        int excessNanos(long d, long m) { return 0; }
    };
    struct DAYS {
        long toNanos(long d)   { return x(d, C6/C0, MAX/(C6/C0)); }
        long toMicros(long d)  { return x(d, C6/C1, MAX/(C6/C1)); }
        long toMillis(long d)  { return x(d, C6/C2, MAX/(C6/C2)); }
        long toSeconds(long d) { return x(d, C6/C3, MAX/(C6/C3)); }
        long toMinutes(long d) { return x(d, C6/C4, MAX/(C6/C4)); }
        long toHours(long d)   { return x(d, C6/C5, MAX/(C6/C5)); }
        long toDays(long d)    { return d; }
        long convert(long d, TimeUnit u) { return u.toDays(d); }
        int excessNanos(long d, long m) { return 0; }
    };
    
    
    /**
     * Scale d by m, checking for overflow.
     * This has a short name to make above code more readable.
     */
    static long x(long d, long m, long over) {
        if (d >  over) return INT64_MAX;
        if (d < -over) return INT64_MIN;
        return d * m;
    }
    
    // To maintain full signature compatibility with 1.5, and to improve the
    // clarity of the generated javadoc (see 6287639: Abstract methods in
    // enum classes should not be listed as abstract), method convert
    // etc. are not declared abstract but otherwise act as abstract methods.
    
    /**
     * Convert the given time duration in the given unit to this
     * unit.  Conversions from finer to coarser granularities
     * truncate, so lose precision. For example converting
     * <tt>999</tt> milliseconds to seconds results in
     * <tt>0</tt>. Conversions from coarser to finer granularities
     * with arguments that would numerically overflow saturate to
     * <tt>Long.MIN_VALUE</tt> if negative or <tt>Long.MAX_VALUE</tt>
     * if positive.
     *
     * <p>For example, to convert 10 minutes to milliseconds, use:
     * <tt>TimeUnit.MILLISECONDS.convert(10L, TimeUnit.MINUTES)</tt>
     *
     * @param sourceDuration the time duration in the given <tt>sourceUnit</tt>
     * @param sourceUnit the unit of the <tt>sourceDuration</tt> argument
     * @return the converted duration in this unit,
     * or <tt>Long.MIN_VALUE</tt> if conversion would negatively
     * overflow, or <tt>Long.MAX_VALUE</tt> if it would positively overflow.
     */
    long convert(long sourceDuration, TimeUnit sourceUnit) {
        assert(false);
    }
    
    /**
     * Equivalent to <tt>NANOSECONDS.convert(duration, this)</tt>.
     * @param duration the duration
     * @return the converted duration,
     * or <tt>Long.MIN_VALUE</tt> if conversion would negatively
     * overflow, or <tt>Long.MAX_VALUE</tt> if it would positively overflow.
     * @see #convert
     */
    long toNanos(long duration) {
        assert(false);
    }
    
    /**
     * Equivalent to <tt>MICROSECONDS.convert(duration, this)</tt>.
     * @param duration the duration
     * @return the converted duration,
     * or <tt>Long.MIN_VALUE</tt> if conversion would negatively
     * overflow, or <tt>Long.MAX_VALUE</tt> if it would positively overflow.
     * @see #convert
     */
    long toMicros(long duration) {
        assert(false);
    }
    
    /**
     * Equivalent to <tt>MILLISECONDS.convert(duration, this)</tt>.
     * @param duration the duration
     * @return the converted duration,
     * or <tt>Long.MIN_VALUE</tt> if conversion would negatively
     * overflow, or <tt>Long.MAX_VALUE</tt> if it would positively overflow.
     * @see #convert
     */
    long toMillis(long duration) {
        assert(false);
    }
    
    /**
     * Equivalent to <tt>SECONDS.convert(duration, this)</tt>.
     * @param duration the duration
     * @return the converted duration,
     * or <tt>Long.MIN_VALUE</tt> if conversion would negatively
     * overflow, or <tt>Long.MAX_VALUE</tt> if it would positively overflow.
     * @see #convert
     */
    long toSeconds(long duration) {
        assert(false);
    }
    
    /**
     * Equivalent to <tt>MINUTES.convert(duration, this)</tt>.
     * @param duration the duration
     * @return the converted duration,
     * or <tt>Long.MIN_VALUE</tt> if conversion would negatively
     * overflow, or <tt>Long.MAX_VALUE</tt> if it would positively overflow.
     * @see #convert
     * @since 1.6
     */
    long toMinutes(long duration) {
        assert(false);
    }
    
    /**
     * Equivalent to <tt>HOURS.convert(duration, this)</tt>.
     * @param duration the duration
     * @return the converted duration,
     * or <tt>Long.MIN_VALUE</tt> if conversion would negatively
     * overflow, or <tt>Long.MAX_VALUE</tt> if it would positively overflow.
     * @see #convert
     * @since 1.6
     */
    long toHours(long duration) {
        assert(false);
    }
    
    /**
     * Equivalent to <tt>DAYS.convert(duration, this)</tt>.
     * @param duration the duration
     * @return the converted duration
     * @see #convert
     * @since 1.6
     */
    long toDays(long duration) {
        assert(false);
    }
    
//    /**
//     * Utility to compute the excess-nanosecond argument to wait,
//     * sleep, join.
//     * @param d the duration
//     * @param m the number of milliseconds
//     * @return the number of nanoseconds
//     */
//    virtual int excessNanos(long d, long m)=0;
//    
//    /**
//     * Performs a timed {@link Object#wait(long, int) Object.wait}
//     * using this time unit.
//     * This is a convenience method that converts timeout arguments
//     * into the form required by the <tt>Object.wait</tt> method.
//     *
//     * <p>For example, you could implement a blocking <tt>poll</tt>
//     * method (see {@link BlockingQueue#poll BlockingQueue.poll})
//     * using:
//     *
//     *  <pre> {@code
//     * synchronized Object poll(long timeout, TimeUnit unit)
//     *     throws InterruptedException {
//     *   while (empty) {
//     *     unit.timedWait(this, timeout);
//     *     ...
//     *   }
//     * }}</pre>
//     *
//     * @param obj the object to wait on
//     * @param timeout the maximum time to wait. If less than
//     * or equal to zero, do not wait at all.
//     * @throws InterruptedException if interrupted while waiting
//     */
//    void timedWait(Object obj, long timeout)
//    throws InterruptedException {
//        if (timeout > 0) {
//            long ms = toMillis(timeout);
//            int ns = excessNanos(timeout, ms);
//            obj.wait(ms, ns);
//        }
//    }
//    
//    /**
//     * Performs a timed {@link Thread#join(long, int) Thread.join}
//     * using this time unit.
//     * This is a convenience method that converts time arguments into the
//     * form required by the <tt>Thread.join</tt> method.
//     *
//     * @param thread the thread to wait for
//     * @param timeout the maximum time to wait. If less than
//     * or equal to zero, do not wait at all.
//     * @throws InterruptedException if interrupted while waiting
//     */
//    void timedJoin(Thread thread, long timeout)
//    throws InterruptedException {
//        if (timeout > 0) {
//            long ms = toMillis(timeout);
//            int ns = excessNanos(timeout, ms);
//            thread.join(ms, ns);
//        }
//    }
//    
//    /**
//     * Performs a {@link Thread#sleep(long, int) Thread.sleep} using
//     * this time unit.
//     * This is a convenience method that converts time arguments into the
//     * form required by the <tt>Thread.sleep</tt> method.
//     *
//     * @param timeout the minimum time to sleep. If less than
//     * or equal to zero, do not sleep at all.
//     * @throws InterruptedException if interrupted while sleeping
//     */
//    void sleep(long timeout) throws InterruptedException {
//        if (timeout > 0) {
//            long ms = toMillis(timeout);
//            int ns = excessNanos(timeout, ms);
//            Thread.sleep(ms, ns);
//        }
//    }
}TimeUnit;



@implementation AdvancedStuct

- (void)convert {
    TimeUnit unit;// = new TimeUnit();


}

@end
