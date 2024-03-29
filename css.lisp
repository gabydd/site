(css 
(* (
  (box-sizing border-box)
  (margin 0)))

(.header (
  (font-size min(10vw 10vh))
  (display flex)
  (flex-direction column)
  (align-items center)
  (margin-bottom 5vh)))

(.title (
  (align-items center)
  (display flex)))

(.nav (
  (display flex)
  (gap min(6vw 6vh))))

(.link (
  (font-size min(6vw 6vh))
  (color "#524747")
  (text-decoration none)))

(.linkhover (
  (color "#ba53c6")))

(.link-current (
  (color "#773edb")))

(body (
  (display flex)
  (flex-direction column)
  (min-height 100vh)))

(.body (
  (font-size min(5vh 5vw))
  (margin-left 8vw)
  (margin-right 8vw)
  (flex 1)))

(.footer (
  (display flex)
  (font-size max(1.5vh 1.5vw))
  (margin-top 5vh)
  (margin-bottom 1vh)
  (margin-left 5vw)
  (margin-right 5vw)
  (align-items flex-end)))

(h2 (
  (font-size min(6vh 6vw))))

(img (
  (max-width 100%)
  (height auto))))