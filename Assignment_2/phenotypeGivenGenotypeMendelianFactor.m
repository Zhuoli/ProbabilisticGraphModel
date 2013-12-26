function phenotypeFactor = phenotypeGivenGenotypeMendelianFactor(isDominant, genotypeVar, phenotypeVar)
% This function computes the probability of each phenotype given the
% different genotypes for a trait.  It assumes that there is 1 dominant
% allele and 1 recessive allele.

% For the genotypes, assignment 1 maps to homozygous dominant, assignment 2
% maps to heterozygous, and assignment 3 maps to homozygous recessive.  For
% example, say that there is a gene with two alleles, dominant allele A and
% recessive allele a.  Assignment 1 would map to AA, assignment 2 would
% make to Aa, and assignment 3 would map to aa.  
% For the phenotypes, 
% assignment 1 maps to having the physical trait, and assignment 2 maps to 
% not having the physical trait.
%
% THE VARIABLE TO THE LEFT OF THE CONDITIONING BAR MUST BE THE FIRST
% VARIABLE IN THE .var FIELD FOR GRADING PURPOSES
%
% Input:
%   isDominant: 1 if the trait is caused by the dominant allele (trait 
%   would be caused by A in example above) and 0 if the trait is caused by
%   the recessive allele (trait would be caused by a in the example above)
%
%   genotypeVar: The variable number for the genotype variable (goes in the
%   .var part of the factor)
%
%   phenotypeVar: The variable number for the phenotype variable (goes in
%   the .var part of the factor)
%
% Output:
%   phenotypeFactor: Factor denoting the probability of having each 
%   phenotype for each genotype
phenotypeFactor = struct('var', [], 'card', [], 'val', []);
phenotypeFactor.card=[2,3];
phenotypeFactor.var=[phenotypeVar,genotypeVar];
phenotypeFactor.val=zeros(1,prod(phenotypeFactor.card));
indxs = 1:prod(phenotypeFactor.card);
for i = indxs,
    assignment=IndexToAssignment(i,phenotypeFactor.card);
    if  assignment(2)== 1 || assignment(2)==2,
        phenotypeFactor=SetValueOfAssignment(phenotypeFactor,assignment,1);
    end
    if assignment(1) == 2,
        phenotypeFactor=SetValueOfAssignment(phenotypeFactor,assignment,0);
    end
    if assignment(1)== 2 && assignment(2)==3,
        phenotypeFactor=SetValueOfAssignment(phenotypeFactor,assignment,1);
    end
            
    if ~isDominant,
        phenotypeFactor.val = ~phenotypeFactor.val;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INSERT YOUR CODE HERE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

% Fill in phenotypeFactor.var.  This should be a 1-D row vector.
% Fill in phenotypeFactor.card.  This should be a 1-D row vector.

%phenotypeFactor.val = zeros(1, prod(phenotypeFactor.card));
% Replace the zeros in phentoypeFactor.val with the correct values.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
