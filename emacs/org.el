;; -*- lexical-binding: nil -*- 
(setq org-agenda-span 10)
(setq org-agenda-files '("~/Notes/org"))
(setq org-deadline-warning-days 0)
(setq org-agenda-include-diary t)
(setq calendar-date-style 'iso)

(setq holiday-hebrew-holidays nil)
(setq holiday-bahai-holidays nil)
(setq holiday-solar-holidays nil)
(setq holiday-general-holidays nil)
(setq holiday-christian-holidays nil)
(setq holiday-other-holidays
      '(
	(holiday-fixed 7 14 "Bastille Day")
	(holiday-fixed 11 7 "October Revolution")
	(holiday-fixed 5 9 "Victory Day")
	))
(setq holiday-islamic-holidays
      '(
	(holiday-islamic 1 10 "‘Āshūrā’")
	(holiday-islamic 3 12 "al-Mawlid al-Nabawī")
	(holiday-islamic 9 27 "Laylat al-Qadr")
	(holiday-islamic 10 1 "‘Īd al-Fiṭr")
	(holiday-islamic 12 10 "‘Īd al-Aḍḥá")
	))


