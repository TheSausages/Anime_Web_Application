package anime.app.anime.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Positive;
import java.util.Set;
import java.util.UUID;
import lombok.Data;
import org.hibernate.annotations.ColumnDefault;

@Data
@Entity
@Table(name = "anime", schema = "anime")
public class Anime {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "anime_id", nullable = false, unique = true)
    private UUID animeId;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "average_episode_length")
    @ColumnDefault("25")
    @Positive(message = "TODO ADD")
    private Integer averageEpisodeLength;

    @OneToMany(
        mappedBy = "id.anime",
        cascade = CascadeType.ALL,
        orphanRemoval = true,
        fetch = FetchType.LAZY
    )
    private Set<AnimeUserInfo> animeUserInfos;

    @OneToMany(
        mappedBy = "anime",
        cascade = CascadeType.ALL,
        orphanRemoval = true,
        fetch = FetchType.LAZY
    )
    private Set<Review> reviews;
}
