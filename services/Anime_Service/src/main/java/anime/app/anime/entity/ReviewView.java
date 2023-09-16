package anime.app.anime.entity;

import jakarta.persistence.*;
import java.time.Instant;
import java.util.UUID;
import org.hibernate.annotations.Immutable;

@Entity
@Table(name = "review_view", schema = "anime")
@Immutable
public class ReviewView {

    @Id
    @Column(name = "review_id")
    private UUID anime_id;

    @Column(name = "title")
    private String title;

    @Column(name = "text")
    private String text;

    @Column(name = "nr_liked")
    private long nrOfLikes;

    @Column(name = "nr_disliked")
    private long nrOfDislikes;

    @Column(name = "nr_reported")
    private long nrOfReports;

    @Column(name = "modification")
    private Instant modification;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "anime_id")
    private Anime anime;
}
