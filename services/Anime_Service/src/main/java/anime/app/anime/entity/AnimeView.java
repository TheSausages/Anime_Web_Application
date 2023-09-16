package anime.app.anime.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.util.UUID;
import org.hibernate.annotations.Immutable;

@Entity
@Table(name = "anime_view", schema = "anime")
@Immutable
public class AnimeView {

    @Id
    @Column(name = "anime_id")
    private UUID anime_id;

    @Column(name = "title")
    private String title;

    @Column(name = "average_episode_length")
    private Integer averageEpisodeLength;

    @Column(name = "avg_grade", columnDefinition = "NUMERIC(4, 2)")
    private Double averageGrade;

    @Column(name = "nr_of_favourites", columnDefinition = "INTEGER")
    private long nrOfFavourites;

    @Column(name = "nr_of_reviews")
    private long nrOfReviews;
}
