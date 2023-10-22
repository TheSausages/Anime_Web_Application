package anime.app.forum.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import java.time.Instant;
import java.util.Set;
import java.util.UUID;
import lombok.AccessLevel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.Length;

@Data
@Entity
@Table(name = "post", schema = "forum")
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "post_id", nullable = false, unique = true)
    private UUID postId;

    @Column(name = "title", nullable = false, unique = true)
    @Length(max = 45, min = 1, message = "TODO ADD")
    @NotBlank(message = "TODO ADD")
    private String title;

    @Column(name = "text", nullable = false)
    @Length(max = 600, min = 1, message = "TODO ADD")
    @NotBlank(message = "TODO ADD")
    private String text;

    @Column(name = "is_blocked", nullable = false)
    @ColumnDefault("false")
    private boolean isBlocked;

    @CreationTimestamp
    @Column(name = "creation")
    private Instant creation;

    @UpdateTimestamp
    @Column(name = "modification")
    private Instant modification;

    @ManyToOne
    @JoinColumn(name = "thread", nullable = false)
    private Thread thread;

    @Column(name = "creator", nullable = false)
    private UUID creator;

    /**
     * This field is used for mapping post responses. It is a copy of the parent object. As such no
     * setter/getter is accessible.
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "answer_to")
    @Getter(AccessLevel.NONE)
    @Setter(AccessLevel.NONE)
    private Post postInner;

    @OneToMany(mappedBy = "postInner")
    private Set<Post> responsesToPost;

    @OneToMany(
        mappedBy = "postUserStatusId.post",
        fetch = FetchType.LAZY,
        cascade = CascadeType.ALL,
        orphanRemoval = true
    )
    private Set<PostUserStatus> postUserStatuses;
}
