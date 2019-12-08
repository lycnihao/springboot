package com.couldr.app.repository.base;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.lang.Nullable;
import org.springframework.util.Assert;

/**
 * Implementation of base repository.
 *
 * @param <DOMAIN> domain type
 * @param <ID>     id type
 * @author johnniang
 */
public class BaseRepositoryImpl<DOMAIN, ID> extends SimpleJpaRepository<DOMAIN, ID> implements BaseRepository<DOMAIN, ID> {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    private final JpaEntityInformation<DOMAIN, ID> entityInformation;

    private final EntityManager entityManager;

    public BaseRepositoryImpl(JpaEntityInformation<DOMAIN, ID> entityInformation, EntityManager entityManager) {
        super(entityInformation, entityManager);
        this.entityInformation = entityInformation;
        this.entityManager = entityManager;
    }

    /**
     * Finds all domain by id list and the specified sort.
     *
     * @param ids  id list of domain must not be null
     * @param sort the specified sort must not be null
     * @return a list of domains
     */
    @Override
    public List<DOMAIN> findAllByIdIn(Iterable<ID> ids, Sort sort) {
        Assert.notNull(ids, "The given Iterable of Id's must not be null!");

        log.debug("Customized findAllById method was invoked");

        if (!ids.iterator().hasNext()) {
            return Collections.emptyList();
        }
        if (!this.entityInformation.hasCompositeId()) {
            ByIdsSpecification<DOMAIN> specification = new ByIdsSpecification<>(this.entityInformation);
            TypedQuery<DOMAIN> query = super.getQuery(specification, sort);
            return query.setParameter(specification.parameter, ids).getResultList();
        } else {
            List<DOMAIN> results = new ArrayList<>();

            ids.forEach(id -> super.findById(id).ifPresent(results::add));

            return results;
        }
    }

    /**
     * Deletes by id list.
     *
     * @param ids id list of domain must not be null
     * @return number of rows affected
     */
    @Override
    public long deleteByIdIn(Iterable<ID> ids) {

        log.debug("Customized deleteByIdIn method was invoked");
        // Find all domains
        List<DOMAIN> domains = findAllById(ids);

        // Delete in batch
        deleteInBatch(domains);

        // Return the size of domain deleted
        return domains.size();
    }

    private static final class ByIdsSpecification<T> implements Specification<T> {
        private static final long serialVersionUID = 1L;
        private final JpaEntityInformation<T, ?> entityInformation;
        @Nullable
        ParameterExpression<Iterable> parameter;

        ByIdsSpecification(JpaEntityInformation<T, ?> entityInformation) {
            this.entityInformation = entityInformation;
        }

        @Override
        public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
            Path<?> path = root.get(this.entityInformation.getIdAttribute());
            this.parameter = cb.parameter(Iterable.class);
            return path.in(this.parameter);
        }
    }
}
