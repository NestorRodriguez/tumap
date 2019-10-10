import { TestBed } from '@angular/core/testing';

import { PredialService } from './predial.service';

describe('PredialService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: PredialService = TestBed.get(PredialService);
    expect(service).toBeTruthy();
  });
});
