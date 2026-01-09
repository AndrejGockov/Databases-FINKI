1.Напиши израз во релациона алгебра што ќе ги прикаже имињата на сите локации со капацитет од најмалку 5.

π name(σ capacity >= 5 (Location))

---

2.Напиши израз во релациона алгебра што ќе ги прикаже насловите на книги што биле изложени на саеми.

π book_title ( Book_Promotion )

---

3.Напиши израз во релациона алгебра што ќе ги прикаже имињата на авторите и локациите на саемите на кои биле промовирани на авторите чија националнсот е ‘German’.

π artistic_name, Location.name (
σ nationality = 'German' (Author)
⨝ Author.author_id = Book_Promotion.author_id Book_Promotion
⨝ Book_Promotion.fair_id = Held_Fair.fair_id AND Held_Fair.date= Book_Promotion.date Held_Fair
⨝ Fair.fair_id = Held_Fair.fair_id Fair
⨝ Fair.location_id = Location.location_id Location
)

---

4.Напиши израз во релациона алгебра што ќе ги прикаже шифрите на издавачите што (a) имаат спонзори, и/или (b) имаат барем една промоција на книга на било кој саем.

promotion ← π Book_Promotion.publisher_id (Book_Promotion)
sponsor ← π Publisher_Sponsor.publisher_id (Publisher_Sponsor)

merge ← promotion ∪ sponsor

π Publisher.publisher_id (
Publisher ⨝ Publisher.publisher_id = merge.publisher_id merge
)

---

5.Напиши израз во релациона алгебра што ќе ги прикаже насловите на книгите кои се изложени на саеми и чии што издавач има повеќе од 3 спонзори.

Temp1 ← γ publisher_id; COUNT(sponsor) → num_sponsors (Publisher_Sponsor)
Temp2 ← σ num_sponsors > 3 (Temp1)
Temp3 ← π publisher_id (Temp2)
π book_title (Temp3 ⨝ Temp3.publisher_id=Book_Promotion.publisher_id Book_Promotion)

---

6.Напиши израз во релациона алгебра што ќе ги прикаже името на саемот, датумот на одржување на саемот и името на локацијата на одржаните саеми на кои учествувале помалку од 6 издавачи.

tmp ← γ Held_Fair.fair_id, Held_Fair.date; COUNT(Book_Promotion.publisher_id) → numPublisher (
Held_Fair ⨝ Held_Fair.date = Book_Promotion.date AND Held_Fair.fair_id = Book_Promotion.fair_id
π Book_Promotion.fair_id, Book_Promotion.date, Book_Promotion.publisher_id Book_Promotion
)

tmp3 ← π tmp.fair_id, tmp.date(
σ tmp.numPublisher < 6 (tmp)
)

filteredFair = π Fair.name, tmp3.date, Location.name(
Fair ⨝ Fair.location_id = Location.location_id Location
⨝ Fair.fair_id = tmp3.fair_id tmp3
)

---

7.Напиши израз во релациона алгебра што ќе ги прикаже името на локацијата, како и насловите на сите книги што биле презентирани и нивните рејтинзи на саемот што се одржувал најчесто.

---

8.Напиши израз во релациона алгебра што ќе ги прикаже спонзорите на издавачите што имале книги со рејтинг поголем од 8 на саеми што траат помалку од 5 дена.

sponsor ← π Publisher_Sponsor.publisher_id, Publisher_Sponsor.sponsor (Publisher_Sponsor)

Temp ← π Book_Promotion.publisher_id, Book_Promotion.fair_id (σ rating > 8 (Book_Promotion))

Temp2 ← π Fair.fair_id, Fair.duration (σ duration < 5 (Fair))

Temp3 ← π Temp.publisher_id (
Temp ⨝ Temp2.fair_id = Temp.fair_id Temp2
)

π sponsor.sponsor(
Temp3 ⨝ Temp3.publisher_id = sponsor.publisher_id sponsor
)
